"use client";

import { useEffect, useState, useCallback } from "react";
import { useRouter, useParams } from "next/navigation";
import { motion, AnimatePresence, useAnimation } from "framer-motion";
import { useAuth } from "@/lib/auth-context";
import { content, progress as progressApi } from "@/lib/api";
import { getBeltByDifficulty } from "@/lib/belts";
import { useAudio } from "@/lib/audio";
import Navbar from "@/components/ui/Navbar";
import { ArrowLeft, ArrowRight, CheckCircle, XCircle } from "@phosphor-icons/react";
import Link from "next/link";
import confetti from "canvas-confetti";
import { shakeX, glowPulse, hoverButton, scaleIn } from "@/lib/animations";

interface QuizQuestion { id: number; question: string; optionA: string; optionB: string; optionC: string; optionD: string; correctOption: number; }
type Phase = "quiz" | "feedback" | "result";

export default function QuizPage() {
  const { user, isAuthenticated, hydrated } = useAuth();
  const router = useRouter();
  const params = useParams();
  const difficulty = params.difficulty as string;
  const belt = getBeltByDifficulty(difficulty);
  const { play, startAmbient, stopAmbient } = useAudio();

  const [questions, setQuestions] = useState<QuizQuestion[]>([]);
  const [current, setCurrent] = useState(0);
  const [selected, setSelected] = useState<number | null>(null);
  const [score, setScore] = useState(0);
  const [phase, setPhase] = useState<Phase>("quiz");
  const [loading, setLoading] = useState(true);
  const feedbackControls = useAnimation();

  useEffect(() => {
    if (!hydrated) return;
    if (!isAuthenticated) { router.push("/"); return; }
    content.getQuizzes(difficulty, user!.token)
      .then((data) => setQuestions(data as unknown as QuizQuestion[]))
      .catch(() => {})
      .finally(() => setLoading(false));
  }, [hydrated, isAuthenticated, router, difficulty, user]);

  useEffect(() => {
    if (!loading && questions.length > 0 && phase === "quiz") {
      startAmbient("tension");
    }
    if (phase === "result") {
      stopAmbient();
    }
  }, [loading, questions.length, phase, startAmbient, stopAmbient]);

  useEffect(() => {
    return () => { stopAmbient(); };
  }, [stopAmbient]);

  const labels = ["A", "B", "C", "D"];
  const options = (q: QuizQuestion) => [q.optionA, q.optionB, q.optionC, q.optionD];

  const fireConfetti = useCallback(() => {
    confetti({ particleCount: 80, spread: 70, origin: { y: 0.6 }, colors: ["#0d9488", "#14b8a6", "#34d399", "#fafafa"] });
  }, []);

  const handleSubmit = async () => {
    if (selected === null) return;
    const q = questions[current];
    const correct = selected === q.correctOption;
    if (correct) {
      setScore((s) => s + 1);
      feedbackControls.start(glowPulse("#34d399"));
      fireConfetti();
      play("correct", 0.4);
    } else {
      feedbackControls.start(shakeX);
      play("incorrect", 0.3);
    }
    try { await progressApi.record({ userId: user!.username, type: "QUIZ", contentId: q.id, correct, difficulty }, user!.token); } catch {}
    setPhase("feedback");
  };

  const handleNext = () => {
    setSelected(null);
    if (current < questions.length - 1) { setCurrent((p) => p + 1); setPhase("quiz"); }
    else {
      setPhase("result");
      const resultPct = questions.length ? Math.round(((score) / questions.length) * 100) : 0;
      if (resultPct >= 70) {
        setTimeout(() => {
          confetti({ particleCount: 150, spread: 100, origin: { y: 0.5 }, colors: ["#0d9488", "#14b8a6", "#eab308", "#fafafa"] });
        }, 300);
      }
    }
  };

  if (!isAuthenticated || loading) return null;
  const q = questions[current];
  const pct = questions.length ? ((current + 1) / questions.length) * 100 : 0;
  const resultPct = questions.length ? Math.round((score / questions.length) * 100) : 0;

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
          <video
            autoPlay
            loop
            muted
            playsInline
            poster="/images/sections/quiz-hero.webp"
            style={{
              position: "absolute",
              inset: 0,
              width: "100%",
              height: "100%",
              objectFit: "cover",
            }}
          >
            <source src="/videos/quiz-hero.mp4" type="video/mp4" />
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
            padding: "24px 28px",
          }}>
            <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
              <div style={{ width: "12px", height: "12px", borderRadius: "50%", background: belt?.color, boxShadow: `0 0 8px ${belt?.color}40` }} />
              <h1 style={{ fontSize: "22px", fontWeight: 700, letterSpacing: "-0.025em", color: "#fafafa", textShadow: "0 2px 8px rgba(0,0,0,0.5)" }}>{belt?.name} — Quiz</h1>
            </div>
          </div>
        </motion.div>

        <div className="w-full overflow-hidden" style={{ height: "3px", background: "rgba(255,255,255,0.06)", borderRadius: "9999px", marginBottom: "32px" }}>
          <motion.div
            animate={{ width: `${pct}%` }}
            transition={{ duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
            style={{ height: "100%", borderRadius: "9999px", background: belt?.color, boxShadow: `0 0 8px ${belt?.color}30` }}
          />
        </div>

        {questions.length === 0 && (
          <div style={{ background: "#141418", border: "1px solid rgba(255,255,255,0.06)", borderRadius: "16px", padding: "48px", textAlign: "center" }}>
            <p style={{ fontSize: "14px", color: "#71717a", marginBottom: "16px" }}>No hay preguntas para este nivel todavia</p>
            <Link href="/dashboard" style={{ fontSize: "14px", fontWeight: 600, color: "#0d9488", textDecoration: "none" }}>Volver al dashboard</Link>
          </div>
        )}

        <AnimatePresence mode="wait">
          {/* Quiz phase */}
          {phase === "quiz" && q && (
            <motion.div key={`q-${current}`}
              initial={{ opacity: 0, x: 30 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: -30 }}
              transition={{ duration: 0.35, ease: [0.16, 1, 0.3, 1] }}
              style={{ background: "rgba(20,20,24,0.7)", backdropFilter: "blur(16px)", WebkitBackdropFilter: "blur(16px)", border: "1px solid rgba(255,255,255,0.08)", borderRadius: "16px", padding: "32px", boxShadow: "0 16px 48px rgba(0,0,0,0.3)" }}>
              <p style={{ fontSize: "11px", color: "#3f3f46", textTransform: "uppercase", letterSpacing: "0.05em", fontWeight: 500, marginBottom: "16px" }}>
                Pregunta {current + 1} de {questions.length}
              </p>
              <h2 style={{ fontSize: "18px", fontWeight: 600, color: "#fafafa", marginBottom: "24px" }}>{q.question}</h2>
              <div style={{ display: "flex", flexDirection: "column", gap: "8px", marginBottom: "24px" }}>
                {options(q).map((opt, i) => (
                  <motion.button key={i} onClick={() => setSelected(i)}
                    whileHover={{ scale: 1.01, borderColor: "rgba(13,148,136,0.4)" }}
                    whileTap={{ scale: 0.98 }}
                    transition={{ type: "spring", stiffness: 400, damping: 25 }}
                    className="w-full flex items-center gap-3"
                    style={{
                      textAlign: "left", padding: "12px 16px", borderRadius: "12px", fontSize: "14px", cursor: "pointer",
                      border: selected === i ? "1px solid #0d9488" : "1px solid rgba(255,255,255,0.06)",
                      background: selected === i ? "rgba(13,148,136,0.1)" : "rgba(26,26,32,0.8)",
                      color: selected === i ? "#fafafa" : "#a1a1aa",
                      boxShadow: selected === i ? "0 0 12px rgba(13,148,136,0.2)" : "none",
                    }}>
                    <motion.span
                      animate={selected === i ? { scale: [1, 1.15, 1] } : {}}
                      className="flex items-center justify-center"
                      style={{
                        width: "28px", height: "28px", borderRadius: "8px", fontSize: "12px", fontWeight: 700,
                        background: selected === i ? "#0d9488" : "rgba(255,255,255,0.06)",
                        color: selected === i ? "#fff" : "#71717a",
                      }}>{labels[i]}</motion.span>
                    {opt}
                  </motion.button>
                ))}
              </div>
              <motion.button onClick={handleSubmit} disabled={selected === null}
                {...hoverButton}
                className="w-full flex items-center justify-center gap-2"
                style={{ padding: "10px 20px", background: "#0d9488", color: "#fff", fontSize: "14px", fontWeight: 600, borderRadius: "10px", border: "none", cursor: "pointer", opacity: selected === null ? 0.3 : 1 }}>
                Confirmar <ArrowRight size={14} weight="bold" />
              </motion.button>
            </motion.div>
          )}

          {/* Feedback phase */}
          {phase === "feedback" && q && (
            <motion.div key={`f-${current}`}
              initial={{ opacity: 0, scale: 0.92 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ type: "spring", stiffness: 300, damping: 25 }}
              style={{ background: "rgba(20,20,24,0.7)", backdropFilter: "blur(16px)", WebkitBackdropFilter: "blur(16px)", border: "1px solid rgba(255,255,255,0.08)", borderRadius: "16px", padding: "32px", textAlign: "center", boxShadow: "0 16px 48px rgba(0,0,0,0.3)" }}>
              <motion.div animate={feedbackControls}>
                {selected === q.correctOption ? (
                  <>
                    <motion.div
                      initial={{ scale: 0, rotate: -180 }}
                      animate={{ scale: 1, rotate: 0 }}
                      transition={{ type: "spring", stiffness: 200, damping: 15 }}
                    >
                      <CheckCircle size={48} weight="fill" style={{ color: "#34d399", margin: "0 auto 12px" }} />
                    </motion.div>
                    <h2 style={{ fontSize: "20px", fontWeight: 700, color: "#fafafa", marginBottom: "4px" }}>Correcto</h2>
                  </>
                ) : (
                  <>
                    <motion.div
                      initial={{ scale: 0 }}
                      animate={{ scale: 1 }}
                      transition={{ type: "spring", stiffness: 300, damping: 20 }}
                    >
                      <XCircle size={48} weight="fill" style={{ color: "#f87171", margin: "0 auto 12px" }} />
                    </motion.div>
                    <h2 style={{ fontSize: "20px", fontWeight: 700, color: "#fafafa", marginBottom: "8px" }}>Incorrecto</h2>
                    <p style={{ fontSize: "14px", color: "#a1a1aa" }}>Respuesta: <span style={{ color: "#e4e4e7", fontWeight: 500 }}>{labels[q.correctOption]}) {options(q)[q.correctOption]}</span></p>
                  </>
                )}
              </motion.div>
              <motion.button onClick={handleNext}
                {...hoverButton}
                style={{ marginTop: "24px", padding: "10px 24px", background: "#0d9488", color: "#fff", fontSize: "14px", fontWeight: 600, borderRadius: "10px", border: "none", cursor: "pointer" }}>
                {current < questions.length - 1 ? "Siguiente" : "Ver resultados"}
              </motion.button>
            </motion.div>
          )}

          {/* Result phase */}
          {phase === "result" && (
            <motion.div key="result"
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              transition={{ type: "spring", stiffness: 200, damping: 20 }}
              style={{ background: "rgba(20,20,24,0.7)", backdropFilter: "blur(16px)", WebkitBackdropFilter: "blur(16px)", border: "1px solid rgba(255,255,255,0.08)", borderRadius: "16px", padding: "32px", textAlign: "center", boxShadow: "0 16px 48px rgba(0,0,0,0.3)" }}>
              <motion.div
                initial={{ scale: 0.5, opacity: 0 }}
                animate={{ scale: 1, opacity: 1 }}
                transition={{ type: "spring", stiffness: 200, damping: 15, delay: 0.15 }}
                className="flex items-center justify-center"
                style={{ margin: "0 auto 16px", width: "120px", height: "120px", borderRadius: "50%", border: `3px solid ${resultPct >= 70 ? "rgba(52,211,153,0.3)" : "rgba(248,113,113,0.2)"}`, display: "flex", alignItems: "center", justifyContent: "center", boxShadow: resultPct >= 70 ? "0 0 24px rgba(52,211,153,0.15)" : "0 0 24px rgba(248,113,113,0.1)" }}
              >
                <p style={{ fontSize: "48px", fontWeight: 800, letterSpacing: "-0.05em", color: resultPct >= 70 ? "#34d399" : "#fafafa", fontFamily: "var(--font-mono), monospace", textShadow: resultPct >= 70 ? "0 0 40px rgba(52,211,153,0.5)" : "0 0 40px rgba(248,113,113,0.3)" }}>
                  {resultPct}%
                </p>
              </motion.div>
              <p style={{ fontSize: "14px", color: "#71717a", marginBottom: "32px" }}>{score} de {questions.length} correctas</p>
              <div className="flex gap-3">
                <motion.button onClick={() => { setCurrent(0); setScore(0); setSelected(null); setPhase("quiz"); }}
                  {...hoverButton}
                  className="flex-1"
                  style={{ padding: "10px 20px", background: "#1a1a20", color: "#e4e4e7", fontSize: "14px", fontWeight: 600, borderRadius: "10px", border: "1px solid rgba(255,255,255,0.08)", cursor: "pointer" }}>
                  Reintentar
                </motion.button>
                <motion.button onClick={() => router.push("/dashboard")}
                  {...hoverButton}
                  className="flex-1"
                  style={{ padding: "10px 20px", background: "#0d9488", color: "#fff", fontSize: "14px", fontWeight: 600, borderRadius: "10px", border: "none", cursor: "pointer" }}>
                  Dashboard
                </motion.button>
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </main>
    </div>
  );
}
