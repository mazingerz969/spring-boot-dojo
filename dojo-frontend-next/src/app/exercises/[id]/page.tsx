"use client";

import { useEffect, useState } from "react";
import { useRouter, useParams } from "next/navigation";
import { motion, AnimatePresence, useAnimation } from "framer-motion";
import { useAuth } from "@/lib/auth-context";
import { exercises as exercisesApi } from "@/lib/api";
import { getBeltByDifficulty } from "@/lib/belts";
import Navbar from "@/components/ui/Navbar";
import { ArrowLeft, Play, Lightbulb, Eye } from "@phosphor-icons/react";
import Link from "next/link";
import confetti from "canvas-confetti";
import { hoverButton, shakeX, fadeUp } from "@/lib/animations";

interface Exercise { id: number; title: string; description: string; difficulty: string; starterCode: string; hint?: string; solution?: string; }
interface ValidationResult { passed: boolean; message?: string; missingKeywords?: string[]; }

export default function ExerciseDetailPage() {
  const { user, isAuthenticated, hydrated } = useAuth();
  const router = useRouter();
  const id = Number(useParams().id);
  const [exercise, setExercise] = useState<Exercise | null>(null);
  const [code, setCode] = useState("");
  const [result, setResult] = useState<ValidationResult | null>(null);
  const [showHint, setShowHint] = useState(false);
  const [showSolution, setShowSolution] = useState(false);
  const [validating, setValidating] = useState(false);
  const [loading, setLoading] = useState(true);
  const resultControls = useAnimation();

  useEffect(() => {
    if (!hydrated) return;
    if (!isAuthenticated) { router.push("/"); return; }
    exercisesApi.getById(id, user!.token)
      .then((data) => { const ex = data as unknown as Exercise; setExercise(ex); setCode(ex.starterCode || ""); })
      .catch(() => {})
      .finally(() => setLoading(false));
  }, [hydrated, isAuthenticated, router, id, user]);

  const handleValidate = async () => {
    if (!exercise) return;
    setValidating(true);
    try {
      const res = await exercisesApi.validate(exercise.id, code, user!.token) as unknown as ValidationResult;
      setResult(res);
      if (res.passed) {
        confetti({ particleCount: 80, spread: 60, origin: { y: 0.7 }, colors: ["#34d399", "#0d9488", "#14b8a6"] });
      } else {
        resultControls.start(shakeX);
      }
    }
    catch { setResult({ passed: false, message: "Error al validar" }); }
    finally { setValidating(false); }
  };

  if (!hydrated || !isAuthenticated || loading || !exercise) return null;
  const belt = getBeltByDifficulty(exercise.difficulty);

  return (
    <div className="min-h-[100dvh]" style={{ background: "#0c0c0f" }}>
      <Navbar />
      <main className="max-w-3xl mx-auto px-6 pb-20" style={{ paddingTop: "120px" }}>
        <Link href="/exercises" className="inline-flex items-center gap-1 mb-6" style={{ fontSize: "14px", color: "#71717a", textDecoration: "none" }}>
          <ArrowLeft size={14} /> Ejercicios
        </Link>

        <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}>
          <div className="flex items-center gap-2 mb-1">
            <div className="w-3 h-3" style={{ borderRadius: "50%", background: belt?.color }} />
            <span style={{ fontSize: "12px", color: "#71717a" }}>{belt?.name}</span>
          </div>
          <h1 style={{ fontSize: "24px", fontWeight: 700, letterSpacing: "-0.025em", color: "#fafafa", marginBottom: "8px" }}>{exercise.title}</h1>
          <p style={{ fontSize: "14px", color: "#a1a1aa", marginBottom: "32px" }}>{exercise.description}</p>
        </motion.div>

        {/* Editor */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.15, ease: [0.16, 1, 0.3, 1] }}
          style={{ background: "#141418", borderRadius: "16px", overflow: "hidden", marginBottom: "16px", border: "1px solid rgba(255,255,255,0.06)" }}
        >
          <div className="flex items-center justify-between" style={{ padding: "10px 16px", borderBottom: "1px solid rgba(255,255,255,0.06)" }}>
            <span style={{ fontSize: "11px", color: "#71717a", fontFamily: "var(--font-mono), monospace" }}>Solution.java</span>
            <div className="flex gap-1.5">
              <div style={{ width: "10px", height: "10px", borderRadius: "50%", background: "#3f3f46" }} />
              <div style={{ width: "10px", height: "10px", borderRadius: "50%", background: "#3f3f46" }} />
              <div style={{ width: "10px", height: "10px", borderRadius: "50%", background: "#3f3f46" }} />
            </div>
          </div>
          <textarea
            value={code} onChange={(e) => setCode(e.target.value)}
            rows={14} spellCheck={false}
            className="w-full"
            style={{
              padding: "20px", background: "transparent", color: "#34d399",
              fontFamily: "var(--font-mono), monospace", fontSize: "14px", lineHeight: 1.6,
              border: "none", outline: "none", resize: "none", tabSize: 4,
            }}
          />
        </motion.div>

        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.25 }}
          className="flex gap-2 mb-6"
        >
          <motion.button onClick={handleValidate} disabled={validating}
            {...hoverButton}
            className="flex items-center gap-2"
            style={{ padding: "10px 20px", background: "#0d9488", color: "#fff", fontSize: "14px", fontWeight: 600, borderRadius: "10px", border: "none", cursor: "pointer", opacity: validating ? 0.4 : 1 }}>
            <Play size={14} weight="fill" /> {validating ? "Validando..." : "Ejecutar"}
          </motion.button>
          {exercise.hint && (
            <motion.button onClick={() => setShowHint(!showHint)}
              {...hoverButton}
              className="flex items-center gap-1.5"
              style={{ padding: "10px 16px", background: "#1a1a20", color: "#a1a1aa", fontSize: "14px", fontWeight: 500, borderRadius: "10px", border: "1px solid rgba(255,255,255,0.08)", cursor: "pointer" }}>
              <Lightbulb size={14} /> Pista
            </motion.button>
          )}
          {exercise.solution && (
            <motion.button onClick={() => setShowSolution(!showSolution)}
              {...hoverButton}
              className="flex items-center gap-1.5"
              style={{ padding: "10px 16px", background: "#1a1a20", color: "#a1a1aa", fontSize: "14px", fontWeight: 500, borderRadius: "10px", border: "1px solid rgba(255,255,255,0.08)", cursor: "pointer" }}>
              <Eye size={14} /> Solucion
            </motion.button>
          )}
        </motion.div>

        <AnimatePresence>
          {showHint && exercise.hint && (
            <motion.div initial={{ opacity: 0, height: 0, y: -8 }} animate={{ opacity: 1, height: "auto", y: 0 }} exit={{ opacity: 0, height: 0, y: -8 }}
              transition={{ duration: 0.3, ease: [0.16, 1, 0.3, 1] }}
              style={{ background: "rgba(245,158,11,0.08)", border: "1px solid rgba(245,158,11,0.2)", borderRadius: "12px", padding: "16px", marginBottom: "16px" }}>
              <p style={{ fontSize: "14px", color: "#fbbf24" }}>{exercise.hint}</p>
            </motion.div>
          )}
          {showSolution && exercise.solution && (
            <motion.div initial={{ opacity: 0, height: 0 }} animate={{ opacity: 1, height: "auto" }} exit={{ opacity: 0, height: 0 }}
              transition={{ duration: 0.3, ease: [0.16, 1, 0.3, 1] }}
              style={{ background: "#141418", borderRadius: "12px", overflow: "hidden", marginBottom: "16px", border: "1px solid rgba(255,255,255,0.06)" }}>
              <pre style={{ padding: "16px", fontSize: "14px", color: "#34d399", fontFamily: "var(--font-mono), monospace", overflowX: "auto" }}>{exercise.solution}</pre>
            </motion.div>
          )}
          {result && (
            <motion.div
              animate={resultControls}
              initial={{ opacity: 0, y: 12 }}
              whileInView={{ opacity: 1, y: 0 }}
              transition={{ type: "spring", stiffness: 300, damping: 25 }}
              style={{
                borderRadius: "12px", padding: "20px",
                background: result.passed ? "rgba(16,185,129,0.08)" : "rgba(239,68,68,0.08)",
                border: result.passed ? "1px solid rgba(16,185,129,0.2)" : "1px solid rgba(239,68,68,0.2)",
              }}>
              <p style={{ fontSize: "14px", fontWeight: 600, marginBottom: "4px", color: result.passed ? "#34d399" : "#f87171" }}>
                {result.passed ? "Correcto" : "No pasa"}
              </p>
              {result.message && <p style={{ fontSize: "12px", color: "#a1a1aa" }}>{result.message}</p>}
              {result.missingKeywords?.length ? (
                <div className="flex flex-wrap gap-1.5" style={{ marginTop: "12px" }}>
                  {result.missingKeywords.map((kw) => (
                    <motion.code
                      key={kw}
                      initial={{ opacity: 0, scale: 0.8 }}
                      animate={{ opacity: 1, scale: 1 }}
                      style={{ padding: "2px 8px", background: "rgba(239,68,68,0.15)", color: "#f87171", borderRadius: "4px", fontSize: "12px", fontFamily: "var(--font-mono), monospace" }}
                    >
                      {kw}
                    </motion.code>
                  ))}
                </div>
              ) : null}
            </motion.div>
          )}
        </AnimatePresence>
      </main>
    </div>
  );
}
