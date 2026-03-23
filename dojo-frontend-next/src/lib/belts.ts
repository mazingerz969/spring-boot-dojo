export interface Belt {
  id: string;
  name: string;
  difficulty: string;
  color: string;
  glowClass: string;
  bgClass: string;
  textClass: string;
  order: number;
}

export const BELTS: Belt[] = [
  {
    id: "white",
    name: "Cinturon Blanco",
    difficulty: "BLANCO",
    color: "#a1a1aa",
    glowClass: "glow-white",
    bgClass: "bg-zinc-200",
    textClass: "text-zinc-800",
    order: 0,
  },
  {
    id: "yellow",
    name: "Cinturon Amarillo",
    difficulty: "AMARILLO",
    color: "#ca8a04",
    glowClass: "glow-yellow",
    bgClass: "bg-yellow-500",
    textClass: "text-yellow-500",
    order: 1,
  },
  {
    id: "orange",
    name: "Cinturon Naranja",
    difficulty: "NARANJA",
    color: "#ea580c",
    glowClass: "glow-orange",
    bgClass: "bg-orange-500",
    textClass: "text-orange-500",
    order: 2,
  },
  {
    id: "green",
    name: "Cinturon Verde",
    difficulty: "VERDE",
    color: "#059669",
    glowClass: "glow-green",
    bgClass: "bg-green-500",
    textClass: "text-green-500",
    order: 3,
  },
  {
    id: "brown",
    name: "Cinturon Marron",
    difficulty: "MARRON",
    color: "#92400e",
    glowClass: "glow-brown",
    bgClass: "bg-amber-800",
    textClass: "text-amber-700",
    order: 4,
  },
  {
    id: "black",
    name: "Cinturon Negro",
    difficulty: "NEGRO",
    color: "#18181b",
    glowClass: "glow-black",
    bgClass: "bg-zinc-900",
    textClass: "text-zinc-100",
    order: 5,
  },
];

export function getBeltByDifficulty(difficulty: string): Belt | undefined {
  return BELTS.find((b) => b.difficulty === difficulty);
}
