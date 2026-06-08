const API_URL = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8080";
const STORAGE_KEY = "dojo-user";

interface RequestOptions {
  method?: string;
  body?: unknown;
  token?: string;
}

async function request<T>(endpoint: string, options: RequestOptions = {}): Promise<T> {
  const { method = "GET", body, token } = options;

  const headers: Record<string, string> = {
    "Content-Type": "application/json",
  };

  if (token) {
    headers["Authorization"] = `Bearer ${token}`;
  }

  let res = await fetch(`${API_URL}${endpoint}`, {
    method,
    headers,
    body: body ? JSON.stringify(body) : undefined,
  });

  if (res.status === 401 && token) {
    const newToken = await tryRefreshToken();
    if (newToken) {
      headers["Authorization"] = `Bearer ${newToken}`;
      res = await fetch(`${API_URL}${endpoint}`, {
        method,
        headers,
        body: body ? JSON.stringify(body) : undefined,
      });
    } else {
      localStorage.removeItem(STORAGE_KEY);
      window.location.href = "/";
      throw new Error("Sesión expirada");
    }
  }

  if (!res.ok) {
    const error = await res.text().catch(() => "Request failed");
    throw new Error(error);
  }

  if (res.status === 204) {
    return undefined as T;
  }

  const text = await res.text();
  if (!text) {
    return undefined as T;
  }

  return JSON.parse(text) as T;
}

async function tryRefreshToken(): Promise<string | null> {
  try {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (!stored) return null;

    const user = JSON.parse(stored);
    if (!user.refreshToken) return null;

    const res = await fetch(`${API_URL}/api/auth/refresh`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ refreshToken: user.refreshToken }),
    });

    if (!res.ok) return null;

    const data = await res.json();
    const updated = { ...user, token: data.token, refreshToken: data.refreshToken };
    localStorage.setItem(STORAGE_KEY, JSON.stringify(updated));

    window.dispatchEvent(new CustomEvent("dojo-token-refreshed", { detail: updated }));
    return data.token;
  } catch {
    return null;
  }
}

// Auth
export const auth = {
  login: (username: string, password: string) =>
    request<{ token: string; refreshToken: string; username: string; role: string }>("/api/auth/login", {
      method: "POST",
      body: { username, password },
    }),

  register: (username: string, email: string, password: string) =>
    request<{ token: string; refreshToken: string; username: string; role: string }>("/api/auth/register", {
      method: "POST",
      body: { username, email, password },
    }),

  logout: (refreshToken: string) =>
    request<void>("/api/auth/logout", {
      method: "POST",
      body: { refreshToken },
    }),
};

// Content
export const content = {
  getFlashcards: (difficulty: string, token: string) =>
    request<Array<Record<string, unknown>>>(`/api/content/flashcards?difficulty=${difficulty}`, { token }),

  getNextFlashcard: (difficulty: string, userId: string, token: string) =>
    request<Record<string, unknown>>(`/api/content/flashcards/next?difficulty=${difficulty}&userId=${userId}`, { token }),

  answerFlashcard: (id: number, data: unknown, token: string) =>
    request<Record<string, unknown>>(`/api/content/flashcards/${id}/answer`, {
      method: "POST",
      body: data,
      token,
    }),

  getQuizzes: (difficulty: string, token: string) =>
    request<Array<Record<string, unknown>>>(`/api/content/quizzes?difficulty=${difficulty}`, { token }),
};

// Progress
export interface UserProgressDto {
  userId?: string;
  totalCorrect?: number;
  totalAttempted?: number;
  currentStreak?: number;
  bestStreak?: number;
  lastStudyDate?: string;
}

export interface BeltProgressDto {
  beltLevel?: string;
  correctCount?: number;
  attemptCount?: number;
  mastered?: boolean;
}

export interface ProgressSummary {
  currentStreak: number;
  bestStreak: number;
  totalCorrect: number;
  accuracy: number;
  beltProgress: Record<string, number>;
  masteredBelts: string[];
}

export function mapProgressResponse(data: Record<string, unknown>): ProgressSummary {
  const p = (data.progress ?? {}) as UserProgressDto;
  const belts = (data.belts ?? []) as BeltProgressDto[];
  const totalAttempted = p.totalAttempted ?? 0;
  const totalCorrect = p.totalCorrect ?? 0;

  const beltProgress: Record<string, number> = {};
  const masteredBelts: string[] = [];
  for (const belt of belts) {
    if (!belt.beltLevel) continue;
    const attempts = belt.attemptCount ?? 0;
    beltProgress[belt.beltLevel] =
      attempts > 0 ? Math.round(((belt.correctCount ?? 0) / attempts) * 100) : 0;
    if (belt.mastered) masteredBelts.push(belt.beltLevel);
  }

  return {
    currentStreak: p.currentStreak ?? 0,
    bestStreak: p.bestStreak ?? 0,
    totalCorrect,
    accuracy: totalAttempted > 0 ? Math.round((totalCorrect / totalAttempted) * 100) : 0,
    beltProgress,
    masteredBelts,
  };
}

export interface RankingEntry {
  userId: string;
  value: number;
  rank?: number;
}

export interface RankingData {
  top10: RankingEntry[];
  userPosition?: number;
  userValue?: number;
}

function mapRankingEntry(raw: Record<string, unknown>): RankingEntry {
  return {
    userId: String(raw.userId ?? raw.username ?? ""),
    value: Number(raw.value ?? raw.totalCorrect ?? raw.bestStreak ?? raw.masteredBelts ?? 0),
    rank: raw.rank != null ? Number(raw.rank) : undefined,
  };
}

export function mapRankingResponse(data: unknown, mode: "global" | "streak" | "belts"): RankingData {
  if (data && typeof data === "object" && !Array.isArray(data) && "top10" in data) {
    const payload = data as Record<string, unknown>;
    const top10 = ((payload.top10 as Array<Record<string, unknown>>) ?? []).map(mapRankingEntry);
    const currentUser = payload.currentUser as Record<string, unknown> | null | undefined;
    return {
      top10,
      userPosition: currentUser?.rank != null ? Number(currentUser.rank) : undefined,
      userValue: currentUser?.value != null ? Number(currentUser.value) : undefined,
    };
  }

  if (Array.isArray(data)) {
    const top10 = data.slice(0, 10).map((item, index) => {
      const row = item as Record<string, unknown>;
      if (row.masteredBelts != null || row.belts != null) {
        return {
          userId: String(row.username ?? row.userId ?? ""),
          value: Number(row.masteredBelts ?? 0),
          rank: index + 1,
        };
      }
      return {
        userId: String(row.userId ?? row.username ?? ""),
        value: mode === "streak"
          ? Number(row.bestStreak ?? row.currentStreak ?? 0)
          : Number(row.totalCorrect ?? 0),
        rank: index + 1,
      };
    });
    return { top10 };
  }

  return { top10: [] };
}

export const progress = {
  get: (username: string, token: string) =>
    request<Record<string, unknown>>(`/api/progress/${username}`, { token }),

  record: (data: { username: string; beltLevel: string; correct: boolean }, token: string) =>
    request<void>("/api/progress/record", {
      method: "POST",
      body: data,
      token,
    }),

  rankingGlobal: (username: string, token: string) =>
    request<Record<string, unknown>>(
      `/api/progress/ranking/global?username=${encodeURIComponent(username)}`,
      { token }
    ).then((data) => mapRankingResponse(data, "global")),

  rankingStreak: (username: string, token: string) =>
    request<Record<string, unknown>>(
      `/api/progress/ranking/streak?username=${encodeURIComponent(username)}`,
      { token }
    ).then((data) => mapRankingResponse(data, "streak")),

  rankingBelts: (username: string, token: string) =>
    request<Record<string, unknown>>(
      `/api/progress/ranking/belts?username=${encodeURIComponent(username)}`,
      { token }
    ).then((data) => mapRankingResponse(data, "belts")),
};

// Exercises
export interface Exercise {
  id: number;
  title: string;
  description: string;
  belt: string;
  difficulty: string;
  starterCode: string;
  hint?: string;
  solution?: string;
}

export function mapExercise(raw: Record<string, unknown>): Exercise {
  const belt = String(raw.belt ?? raw.difficulty ?? "");
  return {
    id: Number(raw.id),
    title: String(raw.title ?? ""),
    description: String(raw.description ?? ""),
    belt,
    difficulty: belt,
    starterCode: String(raw.starterCode ?? ""),
    hint: String(raw.hints ?? raw.hint ?? "") || undefined,
    solution: String(raw.solution ?? "") || undefined,
  };
}

export const exercises = {
  getAll: (token: string) =>
    request<Array<Record<string, unknown>>>("/api/exercises", { token }).then((data) =>
      data.map(mapExercise)
    ),

  getById: (id: number, token: string) =>
    request<Record<string, unknown>>(`/api/exercises/${id}`, { token }).then(mapExercise),

  validate: (id: number, code: string, token: string) =>
    request<Record<string, unknown>>(`/api/exercises/${id}/validate`, {
      method: "POST",
      body: { code },
      token,
    }),
};
