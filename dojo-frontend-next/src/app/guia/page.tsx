"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import { useAuth } from "@/lib/auth-context";

import { ArrowLeft, ArrowRight, GearSix, FolderOpen, MagnifyingGlass, Key, Globe, Layout, Browsers, ChartBar, Cards, Question, TrendUp, Brain, BracketsCurly, CodeBlock, Cube, Buildings } from "@phosphor-icons/react";
import { fadeUp, staggerContainer, staggerItem, hoverButton } from "@/lib/animations";
import { guiaContent } from "@/lib/guia-content";

const chapters = [
  { id: 1, title: "Preparar el entorno", icon: GearSix },
  { id: 2, title: "Estructura del proyecto", icon: FolderOpen },
  { id: 3, title: "Eureka Server", icon: MagnifyingGlass },
  { id: 4, title: "Autenticacion JWT", icon: Key },
  { id: 5, title: "APIs REST", icon: Globe },
  { id: 6, title: "API Gateway", icon: Layout },
  { id: 7, title: "Thymeleaf Templates", icon: Browsers },
  { id: 8, title: "Dashboard", icon: ChartBar },
  { id: 9, title: "Flashcards", icon: Cards },
  { id: 10, title: "Sistema de Quizzes", icon: Question },
  { id: 11, title: "Tracking de Progreso", icon: TrendUp },
  { id: 12, title: "Repeticion Espaciada", icon: Brain },
  { id: 13, title: "Sistema de Cinturones", icon: BracketsCurly },
  { id: 14, title: "Ejercicios de Codigo", icon: CodeBlock },
  { id: 15, title: "Docker Compose", icon: Cube },
  { id: 16, title: "Arquitectura Final", icon: Buildings },
];

export default function GuiaPage() {
  const { isAuthenticated, hydrated } = useAuth();
  const router = useRouter();
  const [active, setActive] = useState(1);

  useEffect(() => {
    if (!hydrated) return;
    if (!isAuthenticated) router.push("/");
  }, [hydrated, isAuthenticated, router]);
  if (!isAuthenticated) return null;

  const ch = chapters.find((c) => c.id === active);
  const Icon = ch?.icon || GearSix;

  return (
    <div className="min-h-[100dvh]" style={{ background: "#0c0c0f" }}>

      <main className="page-main max-w-[1400px] mx-auto">
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
            poster="/images/sections/guia-hero.webp"
            style={{
              position: "absolute",
              inset: 0,
              width: "100%",
              height: "100%",
              objectFit: "cover",
            }}
          >
            <source src="/videos/guia-hero.mp4" type="video/mp4" />
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
            <p style={{ fontSize: "12px", color: "rgba(255,255,255,0.5)", fontFamily: "var(--font-mono), monospace", marginBottom: "4px", letterSpacing: "0.1em", textTransform: "uppercase" }}>guia</p>
            <h1 style={{ fontSize: "32px", fontWeight: 800, letterSpacing: "-0.03em", color: "#fafafa", textShadow: "0 2px 8px rgba(0,0,0,0.5)" }}>Aprende paso a paso</h1>
          </div>
        </motion.div>

        <div className="flex gap-8">
          {/* Sidebar with stagger */}
          <nav className="hidden lg:block w-64 shrink-0">
            <motion.div
              variants={staggerContainer(0.04, 0.2)}
              initial="hidden"
              animate="visible"
              className="sticky top-24"
              style={{
                position: "relative",
                overflow: "hidden",
                display: "flex",
                flexDirection: "column",
                gap: "2px",
                background: "rgba(20,20,24,0.5)",
                backdropFilter: "blur(12px)",
                WebkitBackdropFilter: "blur(12px)",
                border: "1px solid rgba(255,255,255,0.06)",
                borderRadius: "16px",
                padding: "12px",
              }}>
              <div style={{
                position: "absolute",
                inset: 0,
                backgroundImage: "url(/images/textures/dark-wood.webp)",
                backgroundSize: "cover",
                backgroundPosition: "center",
                opacity: 0.10,
                pointerEvents: "none",
              }} />
              {chapters.map((c) => {
                const CI = c.icon;
                return (
                  <motion.button key={c.id} onClick={() => setActive(c.id)}
                    variants={staggerItem}
                    whileHover={{ x: 4, backgroundColor: active === c.id ? "rgba(13,148,136,0.12)" : "rgba(255,255,255,0.03)" }}
                    whileTap={{ scale: 0.98 }}
                    className="w-full flex items-center gap-2.5"
                    style={{
                      textAlign: "left", padding: "10px 12px", borderRadius: "12px", fontSize: "14px", border: "none", cursor: "pointer",
                      background: active === c.id ? "rgba(13,148,136,0.12)" : "transparent",
                      color: active === c.id ? "#14b8a6" : "#71717a",
                      fontWeight: active === c.id ? 600 : 400,
                      borderLeft: active === c.id ? "3px solid #14b8a6" : "3px solid transparent",
                      transition: "border-left 0.2s, background 0.2s, color 0.2s",
                    }}>
                    <CI size={15} weight={active === c.id ? "fill" : "regular"} />
                    <span><span style={{ color: "#3f3f46", fontSize: "12px", fontFamily: "var(--font-mono), monospace", marginRight: "4px" }}>{c.id}.</span>{c.title}</span>
                  </motion.button>
                );
              })}
            </motion.div>
          </nav>

          {/* Content */}
          <div className="flex-1 min-w-0">
            <div className="lg:hidden" style={{ marginBottom: "24px" }}>
              <select value={active} onChange={(e) => setActive(Number(e.target.value))}
                className="w-full"
                style={{
                  padding: "12px 16px", background: "#1a1a20", border: "1px solid rgba(255,255,255,0.08)",
                  borderRadius: "12px", fontSize: "14px", color: "#fafafa", outline: "none",
                }}>
                {chapters.map((c) => <option key={c.id} value={c.id}>{c.id}. {c.title}</option>)}
              </select>
            </div>

            <AnimatePresence mode="wait">
              <motion.div key={active}
                initial={{ opacity: 0, y: 16, scale: 0.98 }}
                animate={{ opacity: 1, y: 0, scale: 1 }}
                exit={{ opacity: 0, y: -12, scale: 0.98 }}
                transition={{ type: "spring", stiffness: 300, damping: 25 }}
                style={{
                  position: "relative",
                  overflow: "hidden",
                  background: "rgba(20,20,24,0.7)",
                  backdropFilter: "blur(16px)",
                  WebkitBackdropFilter: "blur(16px)",
                  border: "1px solid rgba(255,255,255,0.08)",
                  borderRadius: "16px",
                  padding: "32px",
                  boxShadow: "0 16px 48px rgba(0,0,0,0.3)",
                }}>
                <div style={{
                  position: "absolute",
                  inset: 0,
                  backgroundImage: "url(/images/textures/dark-wood.webp)",
                  backgroundSize: "cover",
                  backgroundPosition: "center",
                  opacity: 0.10,
                  pointerEvents: "none",
                }} />
                <div className="flex items-center gap-4" style={{ marginBottom: "32px" }}>
                  <motion.div
                    initial={{ rotate: -90, scale: 0 }}
                    animate={{ rotate: 0, scale: 1 }}
                    transition={{ type: "spring", stiffness: 200, damping: 15, delay: 0.1 }}
                    className="flex items-center justify-center"
                    style={{
                      width: "40px",
                      height: "40px",
                      borderRadius: "12px",
                      background: "linear-gradient(135deg, rgba(13,148,136,0.15), rgba(20,184,166,0.05))",
                      border: "1px solid rgba(13,148,136,0.2)",
                    }}
                  >
                    <Icon size={20} weight="duotone" style={{ color: "#14b8a6" }} />
                  </motion.div>
                  <div>
                    <p style={{ fontSize: "11px", color: "#3f3f46", textTransform: "uppercase", letterSpacing: "0.05em", fontFamily: "var(--font-mono), monospace" }}>Capitulo {active}</p>
                    <h2 style={{ fontSize: "20px", fontWeight: 700, letterSpacing: "-0.025em", color: "#fafafa" }}>{ch?.title}</h2>
                  </div>
                </div>

                {(() => {
                  const chapterData = guiaContent.find((c) => c.id === active);
                  if (!chapterData) return null;
                  return (
                    <motion.div
                      initial={{ opacity: 0 }}
                      animate={{ opacity: 1 }}
                      transition={{ delay: 0.2 }}
                      className="guia-content"
                      style={{ fontSize: "14px", color: "#a1a1aa", lineHeight: 1.8, maxWidth: "75ch" }}
                    >
                      <div style={{
                        padding: "16px 20px",
                        background: "rgba(13,148,136,0.08)",
                        border: "1px solid rgba(13,148,136,0.15)",
                        borderRadius: "12px",
                        marginBottom: "32px",
                        color: "#a1a1aa",
                      }}>
                        <p style={{ margin: 0 }}>{chapterData.intro}</p>
                      </div>
                      {chapterData.sections.map((sec, i) => (
                        <div key={i} style={{ marginBottom: "32px" }}>
                          <h3 style={{ fontSize: "16px", fontWeight: 700, color: "#14b8a6", marginBottom: "16px" }}>{sec.title}</h3>
                          <div
                            dangerouslySetInnerHTML={{ __html: sec.content }}
                            style={{ color: "#a1a1aa" }}
                          />
                        </div>
                      ))}
                    </motion.div>
                  );
                })()}

                <div className="flex justify-between" style={{ marginTop: "40px", paddingTop: "24px", borderTop: "1px solid rgba(255,255,255,0.06)" }}>
                  <motion.button onClick={() => setActive(Math.max(1, active - 1))} disabled={active === 1}
                    {...hoverButton}
                    className="flex items-center gap-1"
                    style={{
                      padding: "8px 20px",
                      fontSize: "14px",
                      color: "#a1a1aa",
                      background: "rgba(26,26,32,0.8)",
                      border: "1px solid rgba(255,255,255,0.08)",
                      borderRadius: "10px",
                      cursor: "pointer",
                      opacity: active === 1 ? 0.3 : 1,
                    }}>
                    <ArrowLeft size={14} /> Anterior
                  </motion.button>
                  <motion.button onClick={() => setActive(Math.min(16, active + 1))} disabled={active === 16}
                    {...hoverButton}
                    className="flex items-center gap-1"
                    style={{
                      padding: "8px 20px",
                      fontSize: "14px",
                      color: "#fff",
                      fontWeight: 500,
                      background: "linear-gradient(135deg, #0d9488, #14b8a6)",
                      border: "none",
                      borderRadius: "10px",
                      cursor: "pointer",
                      opacity: active === 16 ? 0.3 : 1,
                    }}>
                    Siguiente <ArrowRight size={14} />
                  </motion.button>
                </div>
              </motion.div>
            </AnimatePresence>
          </div>
        </div>
      </main>
    </div>
  );
}
