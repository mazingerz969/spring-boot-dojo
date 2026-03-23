const API_URL = process.env.NEXT_PUBLIC_API_URL || "http://localhost:8080";

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

  const res = await fetch(`${API_URL}${endpoint}`, {
    method,
    headers,
    body: body ? JSON.stringify(body) : undefined,
  });

  if (!res.ok) {
    const error = await res.text().catch(() => "Request failed");
    throw new Error(error);
  }

  return res.json();
}

// Auth
export const auth = {
  login: (username: string, password: string) =>
    request<{ token: string; username: string; role: string }>("/api/auth/login", {
      method: "POST",
      body: { username, password },
    }),

  register: (username: string, email: string, password: string) =>
    request<{ token: string; username: string; role: string }>("/api/auth/register", {
      method: "POST",
      body: { username, email, password },
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
export const progress = {
  get: (username: string, token: string) =>
    request<Record<string, unknown>>(`/api/progress/${username}`, { token }),

  record: (data: unknown, token: string) =>
    request<Record<string, unknown>>("/api/progress/record", {
      method: "POST",
      body: data,
      token,
    }),

  rankingGlobal: (token: string) =>
    request<Record<string, unknown>>("/api/progress/ranking/global", { token }),

  rankingStreak: (token: string) =>
    request<Record<string, unknown>>("/api/progress/ranking/streak", { token }),

  rankingBelts: (token: string) =>
    request<Record<string, unknown>>("/api/progress/ranking/belts", { token }),
};

// Exercises
export const exercises = {
  getAll: (token: string) =>
    request<Array<Record<string, unknown>>>("/api/exercises", { token }),

  getById: (id: number, token: string) =>
    request<Record<string, unknown>>(`/api/exercises/${id}`, { token }),

  validate: (id: number, code: string, token: string) =>
    request<Record<string, unknown>>(`/api/exercises/${id}/validate`, {
      method: "POST",
      body: { code },
      token,
    }),
};
