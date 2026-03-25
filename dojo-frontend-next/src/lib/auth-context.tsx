"use client";

import { createContext, useContext, useState, useEffect, useCallback, ReactNode } from "react";
import { auth } from "./api";

interface User {
  token: string;
  refreshToken: string;
  username: string;
  role: string;
}

interface AuthContextType {
  user: User | null;
  login: (user: User) => void;
  logout: () => void;
  isAuthenticated: boolean;
  hydrated: boolean;
}

const STORAGE_KEY = "dojo-user";

function parseTokenExp(token: string): number | null {
  try {
    const payload = JSON.parse(atob(token.split('.')[1]))
    return payload.exp ? payload.exp * 1000 : null
  } catch {
    return null
  }
}

function isTokenExpired(token: string): boolean {
  const exp = parseTokenExp(token)
  if (!exp) return true
  return Date.now() >= exp
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [hydrated, setHydrated] = useState(false);

  const logout = useCallback(() => {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored) {
      try {
        const parsed = JSON.parse(stored);
        if (parsed.refreshToken) {
          auth.logout(parsed.refreshToken).catch(() => {});
        }
      } catch {}
    }
    setUser(null);
    localStorage.removeItem(STORAGE_KEY);
  }, []);

  useEffect(() => {
    const stored = localStorage.getItem(STORAGE_KEY);
    if (stored) {
      try {
        const parsed: User = JSON.parse(stored);
        if (parsed.token && !isTokenExpired(parsed.token)) {
          setUser(parsed);
        } else if (parsed.refreshToken) {
          // Access token expired but we have a refresh token — let api.ts handle it
          setUser(parsed);
        } else {
          localStorage.removeItem(STORAGE_KEY);
        }
      } catch {
        localStorage.removeItem(STORAGE_KEY);
      }
    }
    setHydrated(true);
  }, []);

  // Listen for token refresh events from api.ts
  useEffect(() => {
    const handler = (e: Event) => {
      const detail = (e as CustomEvent).detail as User;
      setUser(detail);
    };
    window.addEventListener("dojo-token-refreshed", handler);
    return () => window.removeEventListener("dojo-token-refreshed", handler);
  }, []);

  const login = (userData: User) => {
    if (!userData.token || isTokenExpired(userData.token)) return;
    setUser(userData);
    localStorage.setItem(STORAGE_KEY, JSON.stringify(userData));
  };

  return (
    <AuthContext.Provider value={{ user, login, logout, isAuthenticated: !!user, hydrated }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (!context) throw new Error("useAuth must be used within AuthProvider");
  return context;
}
