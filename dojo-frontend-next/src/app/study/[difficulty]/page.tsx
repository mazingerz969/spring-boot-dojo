"use client";

import { useEffect, useState } from "react";
import { useRouter, useParams } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import { useAuth } from "@/lib/auth-context";
import { content, progress as progressApi } from "@/lib/api";
import { getBeltByDifficulty } from "@/lib/belts";
import Navbar from "@/components/ui/Navbar";
import { Eye, Check, X, ArrowLeft } from "@phosphor-icons/react";
import Link from "next/link";
import { hoverButton } from "@/lib/animations";

interface Flashcard { id: number; question: string; answer: string; }

export default function StudyPage() {
  const { user, isAuthenticated, hydrated } = useAuth();
  const router = useRouter();
  const params = useParams();
  const difficulty = params.difficulty as string;
  const belt = getBeltByDifficulty(difficulty);


  const [cards, setCards] = useState<Flashcard[]>([]);
  const [current, setCurrent] = useState(0);
  const [showAnswer, setShowAnswer] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!hydrated) return;
    if (!isAuthenticated) { router.push("/"); return; }
    content.getFlashcards(difficulty, user!.token)
      .then((data) => setCards(data as unknown as Flashcard[]))
      .catch(() => {})
      .finally(() => setLoading(false));
  }, [hydrated, isAuthenticated, router, difficulty, user]);


  const handleAnswer = async (knew: boolean) => {
    try {
      await progressApi.record({ userId: user!.username, type: "FLASHCARD", contentId: cards[current].id, correct: knew, difficulty }, user!.token);
    } catch {}
    setShowAnswer(false);
    if (current < cards.length - 1) setCurrent((p) => p + 1);
    else router.push("/dashboard");
  };

  if (!isAuthenticated || loading) return null;
  const card = cards[current];
  const pct = cards.length ? ((current + 1) / cards.length) * 100 : 0;

  return (
    <div className="min-h-[100dvh]" style={{ background: "#0c0c0f" }}>
      <Navbar />
      <main className="max-w-xl mx-auto px-6 pb-20" style={{ paddingTop: "120px" }}>
        <Link href="/dashboard" className="inline-flex items-center gap-1 mb-6" style={{ fontSize: "14px", color: "#71717a", textDecoration: "none" }}>
          <ArrowLeft size={14} /> Dashboard
        </Link>

        <motion.div
          initial={{ opacity: 0, y: 12 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
          style={{
            position: "relative",
            height: "160px",
            borderRadius: "20px",
            overflow: "hidden",
            marginBottom: "28px",
          }}
        >
          <div style={{
            position: "absolute",
            inset: 0,
            backgroundImage: "url(/images/sections/study-hero.webp)",
            backgroundSize: "cover",
            backgroundPosition: "center",
          }} />
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
            padding: "24px 28px",
          }}>
            <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
              <div style={{ width: "12px", height: "12px", borderRadius: "50%", background: belt?.color, boxShadow: `0 0 8px ${belt?.color}40` }} />
              <h1 style={{ fontSize: "22px", fontWeight: 700, letterSpacing: "-0.025em", color: "#fafafa", textShadow: "0 2px 8px rgba(0,0,0,0.5)" }}>{belt?.name}</h1>
            </div>
          </div>
        </motion.div>
        <p style={{ fontSize: "12px", color: "#71717a", fontFamily: "var(--font-mono), monospace", marginBottom: "24px" }}>{current + 1} / {cards.length}</p>

        {/* Progress */}
        <div className="w-full overflow-hidden" style={{ height: "3px", background: "rgba(255,255,255,0.06)", borderRadius: "9999px", marginBottom: "32px" }}>
          <motion.div
            animate={{ width: `${pct}%` }}
            transition={{ duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
            style={{ height: "100%", borderRadius: "9999px", background: belt?.color, boxShadow: `0 0 8px ${belt?.color}30` }}
          />
        </div>

        {card && (
          <AnimatePresence mode="wait">
            <motion.div
              key={current}
              initial={{ opacity: 0, y: 24, scale: 0.97 }}
              animate={{ opacity: 1, y: 0, scale: 1 }}
              exit={{ opacity: 0, y: -20, scale: 0.97 }}
              transition={{ type: "spring", stiffness: 300, damping: 25 }}
              style={{ position: "relative", overflow: "hidden", background: "rgba(20,20,24,0.7)", backdropFilter: "blur(16px)", WebkitBackdropFilter: "blur(16px)", border: "1px solid rgba(255,255,255,0.08)", borderRadius: "16px", padding: "32px", boxShadow: "0 16px 48px rgba(0,0,0,0.3)" }}
            >
              <div style={{
                position: "absolute",
                inset: 0,
                backgroundImage: "url(/images/textures/washi.webp)",
                backgroundSize: "cover",
                backgroundPosition: "center",
                opacity: 0.03,
                mixBlendMode: "overlay",
                pointerEvents: "none",
              }} />
              <p style={{ position: "relative", fontSize: "11px", color: "#3f3f46", textTransform: "uppercase", letterSpacing: "0.05em", fontWeight: 500, marginBottom: "16px" }}>Pregunta</p>
              <h2 style={{ fontSize: "18px", fontWeight: 600, color: "#fafafa", lineHeight: 1.6, marginBottom: "24px" }}>{card.question}</h2>

              <AnimatePresence>
                {showAnswer && (
                  <motion.div
                    initial={{ opacity: 0, height: 0, y: 8 }}
                    animate={{ opacity: 1, height: "auto", y: 0 }}
                    exit={{ opacity: 0, height: 0, y: -8 }}
                    transition={{ duration: 0.35, ease: [0.16, 1, 0.3, 1] }}
                    style={{ paddingTop: "20px", marginBottom: "24px" }}
                  >
                    <div style={{ height: "1px", background: "linear-gradient(90deg, transparent, rgba(255,255,255,0.1), transparent)", marginBottom: "20px" }} />
                    <p style={{ fontSize: "11px", color: "#3f3f46", textTransform: "uppercase", letterSpacing: "0.05em", fontWeight: 500, marginBottom: "12px" }}>Respuesta</p>
                    <motion.p
                      initial={{ opacity: 0 }}
                      animate={{ opacity: 1 }}
                      transition={{ delay: 0.15 }}
                      style={{ fontSize: "16px", color: "#e4e4e7", lineHeight: 1.6 }}
                    >
                      {card.answer}
                    </motion.p>
                  </motion.div>
                )}
              </AnimatePresence>

              {!showAnswer ? (
                <motion.button
                  onClick={() => setShowAnswer(true)}
                  {...hoverButton}
                  className="w-full flex items-center justify-center gap-2"
                  style={{ padding: "10px 20px", background: "linear-gradient(135deg, rgba(26,26,32,0.9), rgba(20,20,24,0.7))", color: "#e4e4e7", fontSize: "14px", fontWeight: 600, borderRadius: "10px", border: "1px solid rgba(255,255,255,0.1)", cursor: "pointer", backdropFilter: "blur(8px)" }}
                >
                  <Eye size={16} /> Mostrar respuesta
                </motion.button>
              ) : (
                <motion.div
                  initial={{ opacity: 0, y: 8 }}
                  animate={{ opacity: 1, y: 0 }}
                  transition={{ delay: 0.1 }}
                  className="flex gap-3"
                >
                  <motion.button
                    onClick={() => handleAnswer(false)}
                    whileHover={{ scale: 1.03, boxShadow: "0 0 16px rgba(239,68,68,0.2)" }}
                    whileTap={{ scale: 0.95 }}
                    className="flex-1 flex items-center justify-center gap-2"
                    style={{ padding: "10px 20px", background: "rgba(239,68,68,0.15)", color: "#f87171", fontSize: "14px", fontWeight: 600, borderRadius: "10px", border: "1px solid rgba(239,68,68,0.25)", cursor: "pointer", backdropFilter: "blur(8px)" }}
                  >
                    <X size={15} weight="bold" /> No lo sabia
                  </motion.button>
                  <motion.button
                    onClick={() => handleAnswer(true)}
                    whileHover={{ scale: 1.03, boxShadow: "0 0 16px rgba(16,185,129,0.2)" }}
                    whileTap={{ scale: 0.95 }}
                    className="flex-1 flex items-center justify-center gap-2"
                    style={{ padding: "10px 20px", background: "rgba(16,185,129,0.15)", color: "#34d399", fontSize: "14px", fontWeight: 600, borderRadius: "10px", border: "1px solid rgba(16,185,129,0.25)", cursor: "pointer", backdropFilter: "blur(8px)" }}
                  >
                    <Check size={15} weight="bold" /> Lo sabia
                  </motion.button>
                </motion.div>
              )}
            </motion.div>
          </AnimatePresence>
        )}

        {cards.length === 0 && !loading && (
          <div style={{ background: "#141418", border: "1px solid rgba(255,255,255,0.06)", borderRadius: "16px", padding: "48px", textAlign: "center" }}>
            <p style={{ color: "#71717a" }}>No hay flashcards para este nivel</p>
          </div>
        )}
      </main>
    </div>
  );
}
