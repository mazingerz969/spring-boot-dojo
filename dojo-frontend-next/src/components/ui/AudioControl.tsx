"use client";

import { motion, AnimatePresence } from "framer-motion";
import { SpeakerHigh, SpeakerSlash } from "@phosphor-icons/react";
import { useAudio } from "@/lib/audio";

export default function AudioControl() {
  const { enabled, toggleAudio } = useAudio();

  return (
    <motion.button
      onClick={toggleAudio}
      whileHover={{ scale: 1.1 }}
      whileTap={{ scale: 0.9 }}
      transition={{ type: "spring", stiffness: 400, damping: 17 }}
      style={{
        padding: "6px",
        borderRadius: "8px",
        background: "transparent",
        border: "none",
        color: enabled ? "#14b8a6" : "#52525b",
        cursor: "pointer",
        position: "relative",
      }}
      title={enabled ? "Silenciar dojo" : "Activar sonido del dojo"}
    >
      <AnimatePresence mode="wait">
        {enabled ? (
          <motion.div
            key="on"
            initial={{ scale: 0, rotate: -90 }}
            animate={{ scale: 1, rotate: 0 }}
            exit={{ scale: 0, rotate: 90 }}
            transition={{ type: "spring", stiffness: 300, damping: 20 }}
          >
            <SpeakerHigh size={14} weight="fill" />
          </motion.div>
        ) : (
          <motion.div
            key="off"
            initial={{ scale: 0, rotate: 90 }}
            animate={{ scale: 1, rotate: 0 }}
            exit={{ scale: 0, rotate: -90 }}
            transition={{ type: "spring", stiffness: 300, damping: 20 }}
          >
            <SpeakerSlash size={14} />
          </motion.div>
        )}
      </AnimatePresence>
    </motion.button>
  );
}
