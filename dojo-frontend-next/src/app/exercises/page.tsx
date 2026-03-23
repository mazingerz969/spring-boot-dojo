"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import { useAuth } from "@/lib/auth-context";
import { exercises as exercisesApi } from "@/lib/api";
import { BELTS, getBeltByDifficulty } from "@/lib/belts";
import Navbar from "@/components/ui/Navbar";
import Link from "next/link";
import { ArrowUpRight } from "@phosphor-icons/react";
import {
  staggerContainer, staggerItem,
  hoverCard, hoverButton, viewportOnce,
} from "@/lib/animations";

interface Exercise { id: number; title: string; description: string; difficulty: string; }

const shimmerItem = {
  hidden: { opacity: 0 },
  visible: { opacity: 1, transition: { duration: 0.4 } },
};

export default function ExercisesPage() {
  const { user, isAuthenticated, hydrated } = useAuth();
  const router = useRouter();
  const [exerciseList, setExerciseList] = useState<Exercise[]>([]);
  const [filter, setFilter] = useState("ALL");
  const [loading, setLoading] = useState(true);
  const [hoveredId, setHoveredId] = useState<number | null>(null);

  useEffect(() => {
    if (!hydrated) return;
    if (!isAuthenticated) { router.push("/"); return; }
    exercisesApi.getAll(user!.token)
      .then((data) => setExerciseList(data as unknown as Exercise[]))
      .catch(() => {})
      .finally(() => setLoading(false));
  }, [hydrated, isAuthenticated, router, user]);

  const filtered = filter === "ALL" ? exerciseList : exerciseList.filter((e) => e.difficulty === filter);

  const activeFilterBelt = BELTS.find((b) => b.difficulty === filter);
  const activeFilterColor = activeFilterBelt?.color ?? "#0d9488";

  return (
    <div className="min-h-[100dvh]" style={{ background: "#0c0c0f" }}>
      <Navbar />
      <main className="max-w-[1400px] mx-auto px-6 sm:px-10 pb-20" style={{ paddingTop: "120px" }}>
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.8 }}
          style={{
            position: "relative",
            height: "200px",
            borderRadius: "20px",
            overflow: "hidden",
            marginBottom: "40px",
          }}
        >
          <video
            autoPlay
            loop
            muted
            playsInline
            poster="/images/sections/exercises-hero.webp"
            style={{
              position: "absolute",
              inset: 0,
              width: "100%",
              height: "100%",
              objectFit: "cover",
            }}
          >
            <source src="/videos/exercises-hero.mp4" type="video/mp4" />
          </video>
          <div style={{
            position: "absolute",
            inset: 0,
            background: "linear-gradient(135deg, rgba(12,12,15,0.7) 0%, rgba(12,12,15,0.3) 50%, rgba(12,12,15,0.8) 100%)",
          }} />
          <div style={{
            position: "relative",
            zIndex: 1,
            height: "100%",
            display: "flex",
            flexDirection: "column",
            justifyContent: "flex-end",
            padding: "28px 32px",
          }}>
            <p style={{ fontSize: "12px", color: "rgba(255,255,255,0.5)", fontFamily: "var(--font-mono), monospace", marginBottom: "4px", letterSpacing: "0.1em", textTransform: "uppercase" }}>ejercicios</p>
            <h1 style={{ fontSize: "32px", fontWeight: 800, letterSpacing: "-0.03em", color: "#fafafa", textShadow: "0 2px 8px rgba(0,0,0,0.5)" }}>Codigo real</h1>
            <p style={{ fontSize: "14px", color: "rgba(255,255,255,0.6)", marginTop: "4px" }}>Practica escribiendo codigo Java real</p>
          </div>
        </motion.div>

        {/* Filters */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.15, duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
          className="flex flex-wrap gap-2"
          style={{
            position: "relative",
            overflow: "hidden",
            background: "rgba(20,20,24,0.6)",
            backdropFilter: "blur(12px)",
            WebkitBackdropFilter: "blur(12px)",
            borderRadius: "12px",
            padding: "8px",
            border: "1px solid rgba(255,255,255,0.06)",
            marginBottom: "40px",
          }}
        >
          <div style={{ position: "absolute", inset: 0, backgroundImage: "url(/images/textures/dark-wood.webp)", backgroundSize: "cover", backgroundPosition: "center", opacity: 0.35, pointerEvents: "none" }} />
          <motion.button
            onClick={() => setFilter("ALL")}
            {...hoverButton}
            style={{
              padding: "6px 12px", borderRadius: "8px", fontSize: "12px", fontWeight: 500, border: "none", cursor: "pointer",
              background: filter === "ALL" ? "#0d9488" : "transparent",
              color: filter === "ALL" ? "#fff" : "#71717a",
            }}>
            Todos
          </motion.button>
          {BELTS.map((b) => (
            <motion.button key={b.id} onClick={() => setFilter(b.difficulty)}
              {...hoverButton}
              className="flex items-center gap-1.5"
              style={{
                padding: "6px 12px", borderRadius: "8px", fontSize: "12px", fontWeight: 500, border: "none", cursor: "pointer",
                background: filter === b.difficulty ? `linear-gradient(135deg, ${b.color}, ${b.color}cc)` : "transparent",
                color: filter === b.difficulty ? "#fff" : "#71717a",
              }}>
              <span style={{ width: "8px", height: "8px", borderRadius: "50%", background: b.color, display: "inline-block" }} />
              {b.name.replace("Cinturon ", "")}
            </motion.button>
          ))}
        </motion.div>

        {/* Loading skeleton */}
        {loading ? (
          <motion.div
            variants={staggerContainer(0.1)}
            initial="hidden"
            animate="visible"
            style={{ display: "flex", flexDirection: "column", gap: "12px" }}
          >
            {[1, 2, 3, 4].map((i) => (
              <motion.div
                key={i}
                variants={shimmerItem}
                style={{
                  height: "80px", background: "#141418", borderRadius: "16px",
                  border: "1px solid rgba(255,255,255,0.06)",
                  borderLeft: "4px solid rgba(255,255,255,0.08)",
                  animation: "pulse 1.5s ease-in-out infinite",
                }}
              />
            ))}
          </motion.div>
        ) : (
          <AnimatePresence mode="wait">
            <motion.div
              key={filter}
              variants={staggerContainer(0.05)}
              initial="hidden"
              animate="visible"
              style={{ display: "flex", flexDirection: "column", gap: "12px" }}
            >
              {filtered.map((ex) => {
                const b = getBeltByDifficulty(ex.difficulty);
                const isHovered = hoveredId === ex.id;
                return (
                  <motion.div key={ex.id} variants={staggerItem}>
                    <Link href={`/exercises/${ex.id}`} style={{ textDecoration: "none" }}>
                      <motion.div
                        {...hoverCard}
                        onMouseEnter={() => setHoveredId(ex.id)}
                        onMouseLeave={() => setHoveredId(null)}
                        className="flex items-center gap-5"
                        style={{
                          position: "relative",
                          overflow: "hidden",
                          padding: "16px 24px",
                          background: isHovered ? `linear-gradient(90deg, ${b?.color}08, transparent)` : "#141418",
                          borderRadius: "16px",
                          border: "1px solid rgba(255,255,255,0.06)",
                          borderLeft: `4px solid ${b?.color}`,
                          transition: "background 0.3s ease",
                        }}
                      >
                        <div style={{ position: "absolute", inset: 0, backgroundImage: "url(/images/textures/dark-wood.webp)", backgroundSize: "cover", backgroundPosition: "center", opacity: 0.10, pointerEvents: "none" }} />
                        <div style={{
                          width: "10px", height: "10px", borderRadius: "50%",
                          background: b?.color, flexShrink: 0,
                          boxShadow: `0 0 8px ${b?.color}40`,
                        }} />
                        <div className="flex-1 min-w-0">
                          <h3 style={{ fontSize: "14px", fontWeight: 600, color: "#e4e4e7" }}>{ex.title}</h3>
                          <p style={{ fontSize: "12px", color: "#71717a", overflow: "hidden", textOverflow: "ellipsis", whiteSpace: "nowrap" }}>{ex.description}</p>
                        </div>
                        <motion.div
                          whileHover={{ x: 3, y: -3 }}
                          transition={{ type: "spring", stiffness: 400, damping: 17 }}
                        >
                          <ArrowUpRight size={16} style={{ color: "#3f3f46", flexShrink: 0 }} />
                        </motion.div>
                      </motion.div>
                    </Link>
                  </motion.div>
                );
              })}

              {filtered.length === 0 && !loading && (
                <motion.div
                  initial={{ opacity: 0, y: 12 }}
                  animate={{ opacity: 1, y: 0 }}
                  style={{ background: "#141418", border: "1px solid rgba(255,255,255,0.06)", borderRadius: "16px", padding: "48px", textAlign: "center" }}
                >
                  <p style={{ fontSize: "14px", color: "#71717a" }}>No hay ejercicios para este nivel</p>
                </motion.div>
              )}
            </motion.div>
          </AnimatePresence>
        )}
      </main>
    </div>
  );
}
