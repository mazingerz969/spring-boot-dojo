import { Variants, Transition } from "framer-motion";

// ─── Easing ────────────────────────────────────────────────
export const ease = {
  out: [0.16, 1, 0.3, 1] as const,
  inOut: [0.76, 0, 0.24, 1] as const,
  spring: { type: "spring" as const, stiffness: 400, damping: 25 },
  springSnappy: { type: "spring" as const, stiffness: 500, damping: 30 },
  springBouncy: { type: "spring" as const, stiffness: 300, damping: 20 },
};

// ─── Fade + Slide variants ─────────────────────────────────
export const fadeUp: Variants = {
  hidden: { opacity: 0, y: 24 },
  visible: { opacity: 1, y: 0, transition: { duration: 0.6, ease: ease.out } },
};

export const fadeDown: Variants = {
  hidden: { opacity: 0, y: -16 },
  visible: { opacity: 1, y: 0, transition: { duration: 0.5, ease: ease.out } },
};

export const fadeIn: Variants = {
  hidden: { opacity: 0 },
  visible: { opacity: 1, transition: { duration: 0.5 } },
};

export const slideInLeft: Variants = {
  hidden: { opacity: 0, x: -30 },
  visible: { opacity: 1, x: 0, transition: { duration: 0.5, ease: ease.out } },
};

export const slideInRight: Variants = {
  hidden: { opacity: 0, x: 30 },
  visible: { opacity: 1, x: 0, transition: { duration: 0.5, ease: ease.out } },
};

export const scaleIn: Variants = {
  hidden: { opacity: 0, scale: 0.92 },
  visible: { opacity: 1, scale: 1, transition: { duration: 0.4, ease: ease.out } },
};

// ─── Stagger containers ────────────────────────────────────
export const staggerContainer = (stagger = 0.08, delay = 0): Variants => ({
  hidden: { opacity: 0 },
  visible: {
    opacity: 1,
    transition: { staggerChildren: stagger, delayChildren: delay },
  },
});

export const staggerItem: Variants = {
  hidden: { opacity: 0, y: 20 },
  visible: { opacity: 1, y: 0, transition: { duration: 0.5, ease: ease.out } },
};

export const staggerItemScale: Variants = {
  hidden: { opacity: 0, y: 16, scale: 0.96 },
  visible: { opacity: 1, y: 0, scale: 1, transition: { duration: 0.5, ease: ease.out } },
};

// ─── Hover / Tap micro-interactions ────────────────────────
export const hoverCard = {
  whileHover: { y: -4, boxShadow: "0 16px 40px rgba(0,0,0,0.3)", transition: ease.spring },
  whileTap: { scale: 0.98, transition: ease.springSnappy },
};

export const hoverScale = {
  whileHover: { scale: 1.04, transition: ease.spring },
  whileTap: { scale: 0.96, transition: ease.springSnappy },
};

export const hoverGlow = (color: string) => ({
  whileHover: {
    boxShadow: `0 0 20px ${color}30, 0 8px 32px rgba(0,0,0,0.3)`,
    y: -2,
    transition: ease.spring,
  },
});

export const hoverButton = {
  whileHover: { scale: 1.03, transition: ease.spring },
  whileTap: { scale: 0.95, transition: ease.springSnappy },
};

// ─── Quiz feedback ─────────────────────────────────────────
export const shakeX = {
  x: [0, -12, 12, -8, 8, -4, 4, 0],
  transition: { duration: 0.5 } as Transition,
};

export const glowPulse = (color: string) => ({
  boxShadow: [
    `0 0 0px ${color}00`,
    `0 0 24px ${color}80`,
    `0 0 48px ${color}40`,
    `0 0 0px ${color}00`,
  ],
  transition: { duration: 0.8 } as Transition,
});

// ─── Page transition ───────────────────────────────────────
export const pageTransition: Variants = {
  initial: { opacity: 0, y: 8 },
  enter: { opacity: 1, y: 0, transition: { duration: 0.35, ease: ease.out } },
  exit: { opacity: 0, y: -8, transition: { duration: 0.2 } },
};

// ─── Kinetic typography ────────────────────────────────────
export const letterContainer = (stagger = 0.03): Variants => ({
  hidden: {},
  visible: { transition: { staggerChildren: stagger } },
});

export const letterVariant: Variants = {
  hidden: { opacity: 0, y: 20, rotateX: -40 },
  visible: {
    opacity: 1,
    y: 0,
    rotateX: 0,
    transition: { duration: 0.4, ease: ease.out },
  },
};

export const wordContainer = (stagger = 0.06): Variants => ({
  hidden: {},
  visible: { transition: { staggerChildren: stagger } },
});

export const wordVariant: Variants = {
  hidden: { opacity: 0, y: 12 },
  visible: { opacity: 1, y: 0, transition: { duration: 0.35, ease: ease.out } },
};

// ─── Viewport defaults ────────────────────────────────────
export const viewportOnce = { once: true, amount: 0.2 as const };
export const viewportHalf = { once: true, amount: 0.5 as const };
