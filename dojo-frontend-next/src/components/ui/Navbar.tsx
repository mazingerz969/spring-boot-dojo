"use client";

import Link from "next/link";
import { useAuth } from "@/lib/auth-context";
import { motion } from "framer-motion";
import { usePathname } from "next/navigation";
import { House, Code, Trophy, BookOpen, SignOut } from "@phosphor-icons/react";
import AudioControl from "@/components/ui/AudioControl";

const navItems = [
  { href: "/dashboard", label: "Dashboard", icon: House },
  { href: "/exercises", label: "Ejercicios", icon: Code },
  { href: "/ranking", label: "Ranking", icon: Trophy },
  { href: "/guia", label: "Guia", icon: BookOpen },
];

export default function Navbar() {
  const { user, logout, isAuthenticated } = useAuth();
  const pathname = usePathname();

  if (!isAuthenticated) return null;

  return (
    <motion.nav
      initial={{ y: -60, opacity: 0 }}
      animate={{ y: 0, opacity: 1 }}
      transition={{ duration: 0.5, ease: [0.16, 1, 0.3, 1] }}
      style={{
        position: "fixed",
        top: "16px",
        left: "50%",
        transform: "translateX(-50%)",
        zIndex: 50,
        width: "calc(100% - 2rem)",
        maxWidth: "800px",
      }}
    >
      <div
        style={{
          position: "relative",
          overflow: "hidden",
          background: "rgba(12,12,15,0.85)",
          backdropFilter: "blur(24px)",
          WebkitBackdropFilter: "blur(24px)",
          border: "1px solid rgba(255,255,255,0.06)",
          borderRadius: "16px",
          padding: "0 20px",
          height: "48px",
          display: "flex",
          alignItems: "center",
          justifyContent: "space-between",
        }}
      >
        <div style={{
          position: "absolute",
          inset: 0,
          backgroundImage: "url(/images/textures/dark-wood.webp)",
          backgroundSize: "cover",
          backgroundPosition: "center",
          opacity: 0.35,
          pointerEvents: "none",
        }} />
        <Link href="/dashboard" style={{ display: "flex", alignItems: "center", gap: "8px", textDecoration: "none" }}>
          <motion.div
            whileHover={{ scale: 1.1, rotate: 5 }}
            whileTap={{ scale: 0.9 }}
            transition={{ type: "spring", stiffness: 400, damping: 17 }}
            style={{ width: "24px", height: "24px", borderRadius: "6px", background: "linear-gradient(135deg, #0d9488, #14b8a6)", display: "flex", alignItems: "center", justifyContent: "center" }}
          >
            <span style={{ fontSize: "9px", fontWeight: 800, color: "white" }}>SD</span>
          </motion.div>
          <span style={{ fontSize: "14px", fontWeight: 700, color: "#e4e4e7" }}>Spring Dojo</span>
        </Link>

        <div style={{ display: "flex", alignItems: "center", gap: "2px" }}>
          {navItems.map((item) => {
            const isActive = pathname === item.href || pathname?.startsWith(item.href + "/");
            const Icon = item.icon;
            return (
              <Link key={item.href} href={item.href} style={{ textDecoration: "none" }}>
                <motion.div
                  whileHover={{ backgroundColor: "rgba(255,255,255,0.08)", y: -1 }}
                  whileTap={{ scale: 0.95 }}
                  transition={{ type: "spring", stiffness: 400, damping: 25 }}
                  style={{
                    position: "relative",
                    padding: "6px 14px",
                    borderRadius: "8px",
                    fontSize: "13px",
                    fontWeight: 500,
                    color: isActive ? "#fff" : "#71717a",
                    display: "flex",
                    alignItems: "center",
                    gap: "6px",
                    backgroundColor: isActive ? "rgba(255,255,255,0.06)" : "transparent",
                  }}
                >
                  <Icon size={14} weight={isActive ? "fill" : "regular"} />
                  <span className="hidden sm:inline">{item.label}</span>
                  {isActive && (
                    <motion.div
                      layoutId="nav-indicator"
                      style={{
                        position: "absolute",
                        bottom: "-1px",
                        left: "50%",
                        transform: "translateX(-50%)",
                        width: "12px",
                        height: "2px",
                        borderRadius: "2px",
                        background: "#14b8a6",
                      }}
                      transition={{ type: "spring", stiffness: 400, damping: 30 }}
                    />
                  )}
                </motion.div>
              </Link>
            );
          })}
        </div>

        <div style={{ display: "flex", alignItems: "center", gap: "8px" }}>
          <AudioControl />
          <span style={{ fontSize: "12px", color: "#52525b" }}>{user?.username}</span>
          <motion.button
            onClick={logout}
            whileHover={{ color: "#f87171", scale: 1.1 }}
            whileTap={{ scale: 0.9 }}
            transition={{ type: "spring", stiffness: 400, damping: 17 }}
            style={{ padding: "6px", borderRadius: "8px", background: "transparent", border: "none", color: "#52525b", cursor: "pointer" }}
          >
            <SignOut size={14} />
          </motion.button>
        </div>
      </div>
    </motion.nav>
  );
}
