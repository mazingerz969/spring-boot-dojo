"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import { auth } from "@/lib/api";
import { useAuth } from "@/lib/auth-context";
import { wordContainer, wordVariant, hoverButton } from "@/lib/animations";

export default function HomePage() {
  const [mode, setMode] = useState<"login" | "register">("login");
  const [username, setUsername] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);
  const router = useRouter();
  const { login } = useAuth();
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    setLoading(true);
    try {
      const res = mode === "login"
        ? await auth.login(username, password)
        : await auth.register(username, email, password);
      login(res);
      router.push("/dashboard");
    } catch (err) {
      setError(err instanceof Error ? err.message : "Error de autenticacion");
    } finally {
      setLoading(false);
    }
  };

  const titleWords = "Spring Dojo".split(" ");
  const subtitleWords = "Domina Spring Boot. Un cinturon a la vez.".split(" ");

  return (
    <div className="relative min-h-[100dvh] flex items-center justify-center overflow-hidden">
      {/* Video background */}
      <video
        autoPlay loop muted playsInline
        poster="/images/dojo-hero.png"
        className="absolute inset-0 w-full h-full object-cover"
      >
        <source src="/images/dojo-hero.mp4" type="video/mp4" />
      </video>
      <div className="absolute inset-0" style={{ background: "linear-gradient(180deg, rgba(0,0,0,0.3) 0%, rgba(12,12,15,0.7) 50%, rgba(12,12,15,0.95) 100%)" }} />

      {/* Content */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 0.5 }}
        className="relative z-10 w-full max-w-[440px] mx-6 text-center"
        style={{
          background: "rgba(10, 10, 14, 0.6)",
          backdropFilter: "blur(20px)",
          WebkitBackdropFilter: "blur(20px)",
          border: "1px solid rgba(255,255,255,0.08)",
          borderRadius: 24,
          padding: "48px 40px",
          boxShadow: "0 32px 64px rgba(0,0,0,0.5)",
        }}
      >
        {/* Kinetic Title */}
        <motion.h1
          variants={wordContainer(0.12)}
          initial="hidden"
          animate="visible"
          style={{ fontFamily: "'Outfit', sans-serif", fontWeight: 800, display: "flex", justifyContent: "center", gap: "12px", flexWrap: "wrap" }}
          className="text-6xl sm:text-7xl tracking-tighter text-white mb-3 leading-[0.9]"
        >
          {titleWords.map((word, i) => (
            <motion.span key={i} variants={wordVariant} style={{ display: "inline-block" }}>
              {word}
            </motion.span>
          ))}
        </motion.h1>

        {/* Kinetic Subtitle */}
        <motion.p
          variants={wordContainer(0.06)}
          initial="hidden"
          animate="visible"
          style={{ fontFamily: "'Outfit', sans-serif", marginBottom: 0, display: "flex", justifyContent: "center", gap: "6px", flexWrap: "wrap" }}
          className="text-white/60 text-base"
        >
          {subtitleWords.map((word, i) => (
            <motion.span key={i} variants={wordVariant} style={{ display: "inline-block" }}>
              {word}
            </motion.span>
          ))}
        </motion.p>

        {/* Separator */}
        <div style={{
          height: 1,
          margin: "32px 0",
          background: "linear-gradient(90deg, transparent, rgba(255,255,255,0.15), transparent)",
        }} />

        {/* Form */}
        <AnimatePresence mode="wait">
          <motion.form
            key={mode}
            initial={{ opacity: 0, y: 12 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -12 }}
            transition={{ duration: 0.3, ease: [0.16, 1, 0.3, 1] }}
            onSubmit={handleSubmit}
          >
            {/* Input: Username */}
            <motion.div
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: 0.4, duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
              style={{ marginBottom: "20px" }}
            >
              <input
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
                style={{
                  fontFamily: "'Outfit', sans-serif",
                  fontSize: "16px",
                  letterSpacing: "0.5px",
                  background: "rgba(255,255,255,0.05)",
                  border: "1px solid rgba(255,255,255,0.1)",
                  borderRadius: 12,
                  padding: "16px 20px",
                  color: "#fff",
                  outline: "none",
                  width: "100%",
                  boxSizing: "border-box",
                  transition: "border-color 0.3s",
                }}
                onFocus={(e) => e.currentTarget.style.borderColor = "rgba(20, 184, 166, 0.5)"}
                onBlur={(e) => e.currentTarget.style.borderColor = "rgba(255,255,255,0.1)"}
                className="w-full"
                placeholder="Email"
              />
            </motion.div>

            {/* Input: Email (register only) */}
            <AnimatePresence>
              {mode === "register" && (
                <motion.div
                  initial={{ opacity: 0, height: 0, marginBottom: 0 }}
                  animate={{ opacity: 1, height: "auto", marginBottom: 40 }}
                  exit={{ opacity: 0, height: 0, marginBottom: 0 }}
                  transition={{ duration: 0.3, ease: [0.16, 1, 0.3, 1] }}
                >
                  <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                    style={{
                      fontFamily: "'Outfit', sans-serif",
                      fontSize: "16px",
                      letterSpacing: "0.5px",
                      background: "rgba(255,255,255,0.05)",
                      border: "1px solid rgba(255,255,255,0.1)",
                      borderRadius: 12,
                      padding: "16px 20px",
                      color: "#fff",
                      outline: "none",
                      width: "100%",
                      boxSizing: "border-box",
                      transition: "border-color 0.3s",
                    }}
                    onFocus={(e) => e.currentTarget.style.borderColor = "rgba(20, 184, 166, 0.5)"}
                    onBlur={(e) => e.currentTarget.style.borderColor = "rgba(255,255,255,0.1)"}
                    className="w-full"
                    placeholder="Email address"
                  />
                </motion.div>
              )}
            </AnimatePresence>

            {/* Input: Password */}
            <motion.div
              initial={{ opacity: 0, x: -20 }}
              animate={{ opacity: 1, x: 0 }}
              transition={{ delay: 0.5, duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
              style={{ marginBottom: "28px" }}
            >
              <input
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                minLength={6}
                style={{
                  fontFamily: "'Outfit', sans-serif",
                  fontSize: "16px",
                  letterSpacing: "0.5px",
                  background: "rgba(255,255,255,0.05)",
                  border: "1px solid rgba(255,255,255,0.1)",
                  borderRadius: 12,
                  padding: "16px 20px",
                  color: "#fff",
                  outline: "none",
                  width: "100%",
                  boxSizing: "border-box",
                  transition: "border-color 0.3s",
                }}
                onFocus={(e) => e.currentTarget.style.borderColor = "rgba(20, 184, 166, 0.5)"}
                onBlur={(e) => e.currentTarget.style.borderColor = "rgba(255,255,255,0.1)"}
                className="w-full"
                placeholder="Password"
              />
            </motion.div>

            {/* Error */}
            <AnimatePresence>
              {error && (
                <motion.p
                  initial={{ opacity: 0, y: -8 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -8 }}
                  className="text-red-300 text-sm text-center mb-6"
                >
                  {error}
                </motion.p>
              )}
            </AnimatePresence>

            {/* Button */}
            <motion.button
              type="submit"
              disabled={loading}
              initial={{ opacity: 0, y: 16 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.6, duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
              whileHover={{ scale: 1.02, boxShadow: "0 8px 32px rgba(20, 184, 166, 0.3)" }}
              whileTap={{ scale: 0.97 }}
              style={{
                fontFamily: "'Outfit', sans-serif",
                background: "linear-gradient(135deg, #0d9488, #14b8a6)",
                color: "#fff",
                border: "none",
                borderRadius: 12,
                padding: "16px",
                fontSize: "14px",
                fontWeight: 700,
                letterSpacing: "0.15em",
                textTransform: "uppercase" as const,
                cursor: "pointer",
                width: "100%",
              }}
              className="w-full disabled:opacity-40"
            >
              {loading ? (
                <span className="inline-block w-5 h-5 border-2 border-zinc-300 border-t-zinc-800 rounded-full animate-spin" />
              ) : mode === "login" ? (
                "SIGN IN"
              ) : (
                "CREATE ACCOUNT"
              )}
            </motion.button>
          </motion.form>
        </AnimatePresence>

        {/* Bottom links */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.8 }}
          className="flex justify-between mt-10"
          style={{ fontFamily: "'Outfit', sans-serif" }}
        >
          <button
            type="button"
            onClick={() => setMode(mode === "login" ? "register" : "login")}
            style={{ color: "rgba(255,255,255,0.65)", fontSize: 14, background: "none", border: "none", cursor: "pointer", transition: "color 0.3s" }}
            onMouseEnter={(e) => e.currentTarget.style.color = "rgba(20, 184, 166, 0.9)"}
            onMouseLeave={(e) => e.currentTarget.style.color = "rgba(255,255,255,0.65)"}
          >
            {mode === "login" ? "Create an Account" : "Sign In"}
          </button>
          <span
            style={{ color: "rgba(255,255,255,0.65)", fontSize: 14, cursor: "pointer", transition: "color 0.3s" }}
            onMouseEnter={(e) => e.currentTarget.style.color = "rgba(20, 184, 166, 0.9)"}
            onMouseLeave={(e) => e.currentTarget.style.color = "rgba(255,255,255,0.65)"}
          >
            Forgot Password?
          </span>
        </motion.div>
      </motion.div>
    </div>
  );
}
