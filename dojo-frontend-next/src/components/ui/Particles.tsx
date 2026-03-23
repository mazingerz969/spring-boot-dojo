"use client";

import { useEffect, useRef } from "react";

interface Particle {
  x: number;
  y: number;
  radius: number;
  speedY: number;
  wobbleSpeed: number;
  wobbleAmplitude: number;
  opacity: number;
  opacitySpeed: number;
  phase: number;
}

function createParticle(width: number, height: number, startFromBottom = false): Particle {
  return {
    x: Math.random() * width,
    y: startFromBottom ? height + Math.random() * 40 : Math.random() * height,
    radius: 2 + Math.random() * 2,
    speedY: 0.15 + Math.random() * 0.35,
    wobbleSpeed: 0.003 + Math.random() * 0.006,
    wobbleAmplitude: 15 + Math.random() * 25,
    opacity: 0.1 + Math.random() * 0.3,
    opacitySpeed: 0.003 + Math.random() * 0.008,
    phase: Math.random() * Math.PI * 2,
  };
}

export default function Particles({ enabled = true }: { enabled?: boolean }) {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const animationRef = useRef<number>(0);
  const particlesRef = useRef<Particle[]>([]);
  const timeRef = useRef(0);

  useEffect(() => {
    if (!enabled) return;

    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    const resize = () => {
      canvas.width = window.innerWidth;
      canvas.height = window.innerHeight;
    };
    resize();
    window.addEventListener("resize", resize);

    const count = 25 + Math.floor(Math.random() * 11);
    particlesRef.current = Array.from({ length: count }, () =>
      createParticle(canvas.width, canvas.height)
    );

    const animate = () => {
      timeRef.current++;
      ctx.clearRect(0, 0, canvas.width, canvas.height);

      for (const p of particlesRef.current) {
        p.y -= p.speedY;
        const wobbleX = Math.sin(timeRef.current * p.wobbleSpeed + p.phase) * p.wobbleAmplitude;
        const pulsingOpacity =
          p.opacity * (0.6 + 0.4 * Math.sin(timeRef.current * p.opacitySpeed + p.phase));

        if (p.y + p.radius < 0) {
          Object.assign(p, createParticle(canvas.width, canvas.height, true));
        }

        ctx.beginPath();
        ctx.arc(p.x + wobbleX, p.y, p.radius, 0, Math.PI * 2);
        ctx.fillStyle = `rgba(212, 175, 55, ${pulsingOpacity})`;
        ctx.fill();
      }

      animationRef.current = requestAnimationFrame(animate);
    };

    animationRef.current = requestAnimationFrame(animate);

    return () => {
      cancelAnimationFrame(animationRef.current);
      window.removeEventListener("resize", resize);
    };
  }, [enabled]);

  if (!enabled) return null;

  return (
    <canvas
      ref={canvasRef}
      style={{
        position: "fixed",
        inset: 0,
        pointerEvents: "none",
        zIndex: 1,
        background: "transparent",
      }}
    />
  );
}
