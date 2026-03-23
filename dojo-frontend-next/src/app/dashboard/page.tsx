"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { motion, useScroll, useTransform } from "framer-motion";
import { useAuth } from "@/lib/auth-context";
import { progress } from "@/lib/api";
import { BELTS } from "@/lib/belts";
import Navbar from "@/components/ui/Navbar";
import Link from "next/link";
import { Fire, Trophy, CheckCircle, Target, Lock, Star } from "@phosphor-icons/react";
import {
  staggerContainer, staggerItem, staggerItemScale,
  hoverCard, hoverButton, hoverGlow,
  fadeUp, viewportOnce,
  letterContainer, letterVariant,
} from "@/lib/animations";

interface Stats {
  currentStreak?: number;
  bestStreak?: number;
  totalCorrect?: number;
  accuracy?: number;
  beltProgress?: Record<string, number>;
  masteredBelts?: string[];
}

const cardStyle: React.CSSProperties = {
  position: "relative",
  overflow: "hidden",
  background: "#141418",
  border: "1px solid rgba(255,255,255,0.06)",
  borderRadius: "16px",
  padding: "24px",
};

const woodTextureOverlay: React.CSSProperties = {
  position: "absolute",
  inset: 0,
  backgroundImage: "url(/images/textures/dark-wood.webp)",
  backgroundSize: "cover",
  backgroundPosition: "center",
  opacity: 0.35,
  pointerEvents: "none",
};

export default function DashboardPage() {
  const { user, isAuthenticated, hydrated } = useAuth();
  const router = useRouter();
  const [stats, setStats] = useState<Stats>({});
  const [loading, setLoading] = useState(true);
  const { scrollYProgress } = useScroll();
  const headerY = useTransform(scrollYProgress, [0, 0.3], [0, -30]);
  const headerOpacity = useTransform(scrollYProgress, [0, 0.15], [1, 0.7]);

  useEffect(() => {
    if (!hydrated) return;
    if (!isAuthenticated) { router.push("/"); return; }
    progress
      .get(user!.username, user!.token)
      .then((data) => setStats(data as Stats))
      .catch(() => {})
      .finally(() => setLoading(false));
  }, [hydrated, isAuthenticated, router, user]);

  if (!isAuthenticated) return null;

  const metrics = [
    { label: "Racha actual", value: stats.currentStreak ?? 0, suffix: "d", icon: Fire, color: "#f97316" },
    { label: "Mejor racha", value: stats.bestStreak ?? 0, suffix: "d", icon: Trophy, color: "#eab308" },
    { label: "Correctas", value: stats.totalCorrect ?? 0, suffix: "", icon: CheckCircle, color: "#22c55e" },
    { label: "Precision", value: stats.accuracy ?? 0, suffix: "%", icon: Target, color: "#14b8a6" },
  ];

  const greeting = `Hola, ${user?.username || ""}`;

  return (
    <div style={{ minHeight: "100dvh", background: "#0c0c0f" }}>
      <Navbar />
      <main style={{ maxWidth: "1200px", margin: "0 auto", padding: "120px 24px 80px" }}>
        {/* Stats with stagger + hover */}
        <motion.div
          variants={staggerContainer(0.08, 0.2)}
          initial="hidden"
          animate="visible"
          style={{ display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(200px, 1fr))", gap: "12px", marginBottom: "64px" }}
        >
          {metrics.map((m) => {
            const Icon = m.icon;
            return (
              <motion.div
                key={m.label}
                variants={staggerItemScale}
                {...hoverGlow(m.color)}
                style={cardStyle}
              >
                <div style={woodTextureOverlay} />
                <div style={{ position: "relative", zIndex: 1 }}>
                  <div style={{ display: "flex", alignItems: "center", gap: "8px", marginBottom: "16px" }}>
                    <Icon size={16} weight="fill" color={m.color} />
                    <span style={{ fontSize: "11px", color: "#71717a", textTransform: "uppercase", letterSpacing: "0.1em", fontWeight: 600 }}>{m.label}</span>
                  </div>
                  <p style={{ fontSize: "32px", fontWeight: 800, color: "#fafafa", fontFamily: "var(--font-mono), monospace", letterSpacing: "-0.02em" }}>
                    {loading ? "..." : <>{m.value}<span style={{ fontSize: "16px", color: "#3f3f46", fontWeight: 500 }}>{m.suffix}</span></>}
                  </p>
                </div>
              </motion.div>
            );
          })}
        </motion.div>

        {/* Belts header */}
        <motion.div
          variants={fadeUp}
          initial="hidden"
          whileInView="visible"
          viewport={viewportOnce}
          style={{ display: "flex", alignItems: "baseline", justifyContent: "space-between", marginBottom: "24px" }}
        >
          <h2 style={{ fontSize: "24px", fontWeight: 700, color: "#fafafa" }}>Cinturones</h2>
          <span style={{ fontSize: "12px", color: "#3f3f46", fontFamily: "var(--font-mono), monospace" }}>6 niveles</span>
        </motion.div>

        {/* Belt cards with stagger on scroll */}
        <motion.div
          variants={staggerContainer(0.1, 0)}
          initial="hidden"
          whileInView="visible"
          viewport={viewportOnce}
          style={{ display: "grid", gridTemplateColumns: "repeat(auto-fill, minmax(340px, 1fr))", gap: "16px" }}
        >
          {BELTS.map((belt, index) => {
            const beltPct = (stats.beltProgress as Record<string, number>)?.[belt.difficulty] ?? 0;
            const isMastered = stats.masteredBelts?.includes(belt.difficulty);
            const isUnlocked = true;
            const hasImage = true;

            return (
              <motion.div
                key={belt.id}
                variants={staggerItem}
                {...(isUnlocked ? hoverCard : {})}
                style={{
                  position: "relative",
                  minHeight: "240px",
                  borderRadius: "16px",
                  border: "1px solid rgba(255,255,255,0.06)",
                  overflow: "hidden",
                  opacity: isUnlocked ? 1 : 0.35,
                  pointerEvents: isUnlocked ? "auto" : "none",
                  background: hasImage ? "#141418" : `linear-gradient(135deg, ${belt.color}40, #141418)`,
                }}
              >
                {/* Background video (black belt) or image */}
                {hasImage && belt.id === "black" ? (
                  <video
                    autoPlay
                    loop
                    muted
                    playsInline
                    poster={`/images/belts/${belt.id}.webp`}
                    style={{
                      position: "absolute",
                      inset: 0,
                      width: "100%",
                      height: "100%",
                      objectFit: "cover",
                    }}
                  >
                    <source src="/videos/belt-black.mp4" type="video/mp4" />
                  </video>
                ) : hasImage ? (
                  <motion.div
                    initial={{ scale: 1 }}
                    whileHover={{ scale: 1.05 }}
                    transition={{ duration: 0.6, ease: [0.16, 1, 0.3, 1] }}
                    style={{
                      position: "absolute",
                      inset: 0,
                      backgroundImage: `url(/images/belts/${belt.id}.webp)`,
                      backgroundSize: "cover",
                      backgroundPosition: "center",
                    }}
                  />
                ) : null}

                {/* Dark overlay gradient */}
                <div
                  style={{
                    position: "absolute",
                    inset: 0,
                    background: hasImage
                      ? "linear-gradient(to top, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.55) 45%, rgba(0,0,0,0.25) 100%)"
                      : "none",
                    pointerEvents: "none",
                  }}
                />

                {/* Content positioned at bottom */}
                <div
                  style={{
                    position: "relative",
                    zIndex: 1,
                    display: "flex",
                    flexDirection: "column",
                    justifyContent: "flex-end",
                    height: "100%",
                    padding: "24px",
                  }}
                >
                  {/* Belt header */}
                  <div style={{ display: "flex", alignItems: "center", justifyContent: "space-between", marginBottom: "16px" }}>
                    <div style={{ display: "flex", alignItems: "center", gap: "12px" }}>
                      <motion.div
                        animate={isMastered ? {
                          boxShadow: [`0 0 8px ${belt.color}40`, `0 0 20px ${belt.color}60`, `0 0 8px ${belt.color}40`],
                        } : {}}
                        transition={isMastered ? { duration: 2, repeat: Infinity } : {}}
                        style={{
                          width: "16px", height: "16px", borderRadius: "50%",
                          background: belt.color,
                          boxShadow: `0 0 12px ${belt.color}40`,
                        }}
                      />
                      <h3 style={{ fontSize: "16px", fontWeight: 700, color: "#fafafa", textShadow: hasImage ? "0 1px 4px rgba(0,0,0,0.5)" : "none" }}>{belt.name}</h3>
                    </div>
                    {!isUnlocked && <Lock size={14} color="#52525b" />}
                    {isMastered && (
                      <div style={{ display: "flex", alignItems: "center", gap: "4px", color: "#22c55e" }}>
                        <Star size={12} weight="fill" />
                        <span style={{ fontSize: "10px", fontWeight: 700, textTransform: "uppercase", letterSpacing: "0.1em" }}>Dominado</span>
                      </div>
                    )}
                  </div>

                  {/* Progress bar */}
                  <div style={{ width: "100%", height: "3px", background: "rgba(255,255,255,0.1)", borderRadius: "4px", overflow: "hidden", marginBottom: "8px" }}>
                    <motion.div
                      initial={{ width: 0 }}
                      whileInView={{ width: `${beltPct}%` }}
                      viewport={{ once: true }}
                      transition={{ duration: 1, delay: 0.2 + index * 0.08, ease: [0.16, 1, 0.3, 1] }}
                      style={{ height: "100%", borderRadius: "4px", background: belt.color }}
                    />
                  </div>
                  <p style={{ fontSize: "11px", color: "#a1a1aa", fontFamily: "var(--font-mono), monospace", marginBottom: "16px" }}>{beltPct}%</p>

                  {/* Actions */}
                  {isUnlocked && (
                    <div style={{ display: "flex", gap: "8px" }}>
                      <Link href={`/study/${belt.difficulty}`} style={{ flex: 1, textDecoration: "none" }}>
                        <motion.div
                          {...hoverButton}
                          style={{
                            textAlign: "center", padding: "10px 0",
                            fontSize: "12px", fontWeight: 600, color: "#e4e4e7",
                            background: "rgba(255,255,255,0.08)", border: "1px solid rgba(255,255,255,0.1)",
                            borderRadius: "10px",
                            backdropFilter: "blur(8px)",
                          }}
                        >
                          Estudiar
                        </motion.div>
                      </Link>
                      <Link href={`/quiz/${belt.difficulty}`} style={{ flex: 1, textDecoration: "none" }}>
                        <motion.div
                          {...hoverButton}
                          style={{
                            textAlign: "center", padding: "10px 0",
                            fontSize: "12px", fontWeight: 600, color: "#fff",
                            background: "linear-gradient(135deg, #0d9488, #14b8a6)",
                            border: "none", borderRadius: "10px",
                          }}
                        >
                          Quiz
                        </motion.div>
                      </Link>
                    </div>
                  )}
                </div>
              </motion.div>
            );
          })}
        </motion.div>
      </main>
    </div>
  );
}
