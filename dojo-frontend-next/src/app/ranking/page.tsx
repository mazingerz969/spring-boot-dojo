"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import { useAuth } from "@/lib/auth-context";
import { progress as progressApi, type RankingData } from "@/lib/api";

import { Star, Fire, Medal, Crown } from "@phosphor-icons/react";
import { staggerContainer, staggerItem, hoverButton, viewportOnce } from "@/lib/animations";

interface RankingEntry { userId: string; value: number; rank?: number; }
type Tab = "global" | "streak" | "belts";

const tabs: { id: Tab; label: string; icon: typeof Star }[] = [
  { id: "global", label: "Respuestas", icon: Star },
  { id: "streak", label: "Rachas", icon: Fire },
  { id: "belts", label: "Cinturones", icon: Medal },
];

const podiumColors = ["#eab308", "#a1a1aa", "#cd7f32"];

export default function RankingPage() {
  const { user, isAuthenticated, hydrated } = useAuth();
  const router = useRouter();
  const [activeTab, setActiveTab] = useState<Tab>("global");
  const [data, setData] = useState<Record<Tab, RankingData | null>>({ global: null, streak: null, belts: null });
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!hydrated) return;
    if (!isAuthenticated) { router.push("/"); return; }
    Promise.all([
      progressApi.rankingGlobal(user!.username, user!.token),
      progressApi.rankingStreak(user!.username, user!.token),
      progressApi.rankingBelts(user!.username, user!.token),
    ]).then(([g, s, b]) => setData({
      global: g,
      streak: s,
      belts: b,
    })).catch(() => {}).finally(() => setLoading(false));
  }, [hydrated, isAuthenticated, router, user]);

  if (!isAuthenticated) return null;
  const current = data[activeTab];
  const top10 = current?.top10 ?? [];
  const userInTop10 = top10.some((entry) => entry.userId === user?.username);
  const hasData = !loading && top10.length > 0;
  const top3 = hasData ? top10.slice(0, 3) : [];
  const showPodium = hasData && top3.length >= 3;

  return (
    <div className="min-h-[100dvh]" style={{ background: "#0c0c0f" }}>

      <main className="page-main max-w-2xl mx-auto">
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.8 }}
          style={{
            position: "relative",
            height: "160px",
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
            poster="/images/sections/ranking-hero.webp"
            style={{
              position: "absolute",
              inset: 0,
              width: "100%",
              height: "100%",
              objectFit: "cover",
            }}
          >
            <source src="/videos/ranking-hero.mp4" type="video/mp4" />
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
            <p style={{ fontSize: "12px", color: "rgba(255,255,255,0.5)", fontFamily: "var(--font-mono), monospace", marginBottom: "4px", letterSpacing: "0.1em", textTransform: "uppercase" }}>ranking</p>
            <h1 style={{ fontSize: "32px", fontWeight: 800, letterSpacing: "-0.03em", color: "#fafafa", textShadow: "0 2px 8px rgba(0,0,0,0.5)" }}>Clasificacion</h1>
            <p style={{ fontSize: "14px", color: "rgba(255,255,255,0.6)", marginTop: "4px" }}>Compite con otros estudiantes del dojo</p>
          </div>
        </motion.div>

        {/* Tabs */}
        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.15, ease: [0.16, 1, 0.3, 1] }}
          className="flex gap-1"
          style={{
            position: "relative",
            overflow: "hidden",
            background: "rgba(20,20,24,0.6)",
            backdropFilter: "blur(12px)",
            WebkitBackdropFilter: "blur(12px)",
            border: "1px solid rgba(255,255,255,0.06)",
            borderRadius: "12px",
            padding: "4px",
            marginBottom: "32px",
          }}
        >
          <div style={{ position: "absolute", inset: 0, backgroundImage: "url(/images/textures/dark-wood.webp)", backgroundSize: "cover", backgroundPosition: "center", opacity: 0.35, pointerEvents: "none" }} />
          {tabs.map((tab) => {
            const Icon = tab.icon;
            return (
              <motion.button key={tab.id} onClick={() => setActiveTab(tab.id)}
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.98 }}
                className="relative flex-1 flex items-center justify-center gap-1.5"
                style={{
                  padding: "8px 0", fontSize: "14px", fontWeight: 500, borderRadius: "8px", border: "none", cursor: "pointer",
                  background: activeTab === tab.id ? "rgba(13,148,136,0.15)" : "transparent",
                  color: activeTab === tab.id ? "#14b8a6" : "#71717a",
                  boxShadow: activeTab === tab.id ? "0 1px 3px rgba(0,0,0,0.3)" : "none",
                  transition: "background 0.2s, color 0.2s",
                }}>
                <Icon size={14} weight={activeTab === tab.id ? "fill" : "regular"} />{tab.label}
              </motion.button>
            );
          })}
        </motion.div>

        {/* Podium for top 3 */}
        {showPodium && (
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.2, ease: [0.16, 1, 0.3, 1] }}
            style={{
              display: "grid",
              gridTemplateColumns: "1fr 1.2fr 1fr",
              gap: "12px",
              alignItems: "flex-end",
              marginBottom: "24px",
            }}
          >
            {[top3[1], top3[0], top3[2]].map((entry, idx) => {
              const podiumIdx = idx === 0 ? 1 : idx === 1 ? 0 : 2;
              const isCenter = idx === 1;
              return (
                <motion.div
                  key={entry.userId}
                  initial={{ opacity: 0, y: 30 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: 0.3 + idx * 0.1, type: "spring", stiffness: 200, damping: 20 }}
                  style={{
                    position: "relative",
                    overflow: "hidden",
                    minHeight: isCenter ? "140px" : "110px",
                    background: "rgba(20,20,24,0.7)",
                    backdropFilter: "blur(12px)",
                    WebkitBackdropFilter: "blur(12px)",
                    border: "1px solid rgba(255,255,255,0.08)",
                    borderRadius: "16px",
                    borderBottom: `3px solid ${podiumColors[podiumIdx]}`,
                    padding: "20px 16px",
                    display: "flex",
                    flexDirection: "column",
                    alignItems: "center",
                    justifyContent: "center",
                    gap: "8px",
                  }}
                >
                  <div style={{ position: "absolute", inset: 0, backgroundImage: "url(/images/textures/dark-wood.webp)", backgroundSize: "cover", backgroundPosition: "center", opacity: 0.35, pointerEvents: "none" }} />
                  <span style={{
                    fontSize: "11px",
                    fontFamily: "var(--font-mono), monospace",
                    color: podiumColors[podiumIdx],
                    fontWeight: 700,
                    letterSpacing: "0.08em",
                  }}>
                    #{podiumIdx + 1}
                  </span>
                  <Crown size={isCenter ? 28 : 22} weight="fill" color={podiumColors[podiumIdx]} />
                  <span style={{
                    fontSize: isCenter ? "15px" : "13px",
                    fontWeight: 600,
                    color: entry.userId === user?.username ? "#14b8a6" : "#e4e4e7",
                    textAlign: "center",
                    wordBreak: "break-all",
                  }}>
                    {entry.userId}
                  </span>
                  <span style={{
                    fontSize: "14px",
                    fontFamily: "var(--font-mono), monospace",
                    color: podiumColors[podiumIdx],
                    fontWeight: 700,
                  }}>
                    {entry.value}
                  </span>
                </motion.div>
              );
            })}
          </motion.div>
        )}

        {/* Ranking list */}
        <motion.div
          initial={{ opacity: 0, scale: 0.98 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ delay: 0.2, ease: [0.16, 1, 0.3, 1] }}
          style={{
            position: "relative",
            background: "rgba(20,20,24,0.7)",
            backdropFilter: "blur(16px)",
            WebkitBackdropFilter: "blur(16px)",
            border: "1px solid rgba(255,255,255,0.06)",
            borderRadius: "16px",
            marginBottom: "32px",
          }}
        >
          <div style={{ position: "relative", zIndex: 1 }}>
          {loading ? (
            <div style={{ padding: "24px", display: "flex", flexDirection: "column", gap: "16px" }}>
              {[1,2,3,4,5].map((i) => (
                <motion.div
                  key={i}
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  transition={{ delay: i * 0.08 }}
                  style={{ height: "40px", background: "#1a1a20", borderRadius: "8px" }}
                />
              ))}
            </div>
          ) : top10.length ? (
            <AnimatePresence mode="wait">
              <motion.div
                key={activeTab}
                variants={staggerContainer(0.06)}
                initial="hidden"
                animate="visible"
              >
                {top10.map((entry, i) => {
                  const displayRank = entry.rank ?? i + 1;
                  const isTopThree = displayRank <= 3;
                  return (
                    <motion.div key={`${entry.userId}-${displayRank}`} variants={staggerItem}
                      whileHover={{ backgroundColor: "rgba(255,255,255,0.03)" }}
                      className="flex items-center gap-4"
                      style={{
                        padding: "14px 24px",
                        borderBottom: i < top10.length - 1 || (!userInTop10 && current?.userPosition != null)
                          ? "1px solid rgba(255,255,255,0.03)"
                          : "none",
                        background: entry.userId === user?.username
                          ? "rgba(13,148,136,0.12)"
                          : isTopThree
                            ? "rgba(255,255,255,0.02)"
                            : "transparent",
                        borderLeft: entry.userId === user?.username
                          ? "3px solid #14b8a6"
                          : isTopThree
                            ? `3px solid ${podiumColors[displayRank - 1]}55`
                            : "3px solid transparent",
                      }}>
                      <span style={{
                        width: "24px", textAlign: "center", fontSize: isTopThree ? "14px" : "12px",
                        fontFamily: "var(--font-mono), monospace",
                        color: isTopThree ? podiumColors[displayRank - 1] : "#3f3f46",
                        fontWeight: 700,
                      }}>
                        {isTopThree ? <Crown size={16} weight="fill" color={podiumColors[displayRank - 1]} /> : displayRank}
                      </span>
                      <span className="flex-1" style={{ fontSize: "14px", fontWeight: 500, color: entry.userId === user?.username ? "#14b8a6" : "#e4e4e7" }}>
                        {entry.userId}
                        {entry.userId === user?.username && <span style={{ fontSize: "10px", color: "#0d9488", marginLeft: "6px" }}>(tu)</span>}
                      </span>
                      <motion.span
                        initial={{ opacity: 0, scale: 0.5 }}
                        animate={{ opacity: 1, scale: 1 }}
                        transition={{ delay: 0.3 + i * 0.06, type: "spring", stiffness: 300, damping: 20 }}
                        style={{ fontSize: "14px", fontFamily: "var(--font-mono), monospace", color: "#71717a", fontWeight: 500 }}
                      >
                        {entry.value}
                      </motion.span>
                    </motion.div>
                  );
                })}

                {!userInTop10 && current?.userPosition != null && (
                  <>
                    <div style={{ padding: "8px 24px", textAlign: "center", fontSize: "12px", color: "#52525b" }}>...</div>
                    <motion.div
                      variants={staggerItem}
                      className="flex items-center gap-4"
                      style={{
                        padding: "14px 24px",
                        background: "rgba(13,148,136,0.12)",
                        borderLeft: "3px solid #14b8a6",
                      }}
                    >
                      <span style={{
                        width: "24px", textAlign: "center", fontSize: "12px",
                        fontFamily: "var(--font-mono), monospace", color: "#3f3f46", fontWeight: 700,
                      }}>
                        {current.userPosition}
                      </span>
                      <span className="flex-1" style={{ fontSize: "14px", fontWeight: 500, color: "#14b8a6" }}>
                        {user?.username}
                        <span style={{ fontSize: "10px", color: "#0d9488", marginLeft: "6px" }}>(tu)</span>
                      </span>
                      <span style={{ fontSize: "14px", fontFamily: "var(--font-mono), monospace", color: "#71717a", fontWeight: 500 }}>
                        {current.userValue ?? 0}
                      </span>
                    </motion.div>
                  </>
                )}
              </motion.div>
            </AnimatePresence>
          ) : (
            <div style={{ padding: "48px", textAlign: "center", fontSize: "14px", color: "#71717a" }}>
              Sin datos — completa quizzes para aparecer en el ranking
            </div>
          )}
          </div>
          <div style={{ position: "absolute", inset: 0, backgroundImage: "url(/images/textures/dark-wood.webp)", backgroundSize: "cover", backgroundPosition: "center", opacity: 0.35, pointerEvents: "none" }} />
        </motion.div>
      </main>
    </div>
  );
}
