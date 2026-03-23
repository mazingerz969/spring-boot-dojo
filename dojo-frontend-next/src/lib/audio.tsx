"use client";

import { createContext, useContext, useState, useCallback, useRef, useEffect, ReactNode } from "react";
import { Howl } from "howler";

type SoundName =
  | "gong" | "shoji" | "katana"
  | "correct" | "incorrect" | "transition"
  | "bell" | "bowl" | "wood-tap" | "scroll";

type AmbientName = "zen" | "tension";

const SOUND_PATHS: Record<SoundName, string> = {
  gong: "/audio/gong-short.mp3",
  shoji: "/audio/shoji-short.mp3",
  katana: "/audio/katana-short.mp3",
  correct: "/audio/bell.mp3",
  incorrect: "/audio/bowl.mp3",
  transition: "/audio/shoji-short.mp3",
  bell: "/audio/bell.mp3",
  bowl: "/audio/bowl.mp3",
  "wood-tap": "/audio/wood-tap.mp3",
  scroll: "/audio/scroll.mp3",
};

const AMBIENT_PATHS: Record<AmbientName, string> = {
  zen: "/audio/ambient-zen.mp3",
  tension: "/audio/ambient-tension.mp3",
};

const BELT_SOUNDS: Record<string, SoundName> = {
  white: "wood-tap",
  yellow: "wood-tap",
  orange: "bell",
  green: "bell",
  brown: "gong",
  black: "gong",
};

interface AudioContextType {
  enabled: boolean;
  volume: number;
  toggleAudio: () => void;
  setVolume: (v: number) => void;
  play: (sound: SoundName, volumeOverride?: number) => void;
  playBeltSound: (beltId: string) => void;
  startAmbient: (name: AmbientName) => void;
  stopAmbient: () => void;
}

const AudioCtx = createContext<AudioContextType>({
  enabled: false,
  volume: 0.5,
  toggleAudio: () => {},
  setVolume: () => {},
  play: () => {},
  playBeltSound: () => {},
  startAmbient: () => {},
  stopAmbient: () => {},
});

export function AudioProvider({ children }: { children: ReactNode }) {
  const [enabled, setEnabled] = useState(false);
  const [volume, setVolumeState] = useState(0.5);
  const soundsRef = useRef<Map<string, Howl>>(new Map());
  const ambientRef = useRef<Howl | null>(null);

  useEffect(() => {
    const saved = localStorage.getItem("dojo-audio");
    if (saved === "true") setEnabled(true);
    const savedVol = localStorage.getItem("dojo-volume");
    if (savedVol) setVolumeState(parseFloat(savedVol));
  }, []);

  useEffect(() => {
    if (!enabled && ambientRef.current) {
      ambientRef.current.fade(ambientRef.current.volume(), 0, 500);
      setTimeout(() => { ambientRef.current?.stop(); }, 500);
    }
  }, [enabled]);

  const getSound = useCallback((path: string): Howl => {
    let howl = soundsRef.current.get(path);
    if (!howl) {
      howl = new Howl({ src: [path], preload: true });
      soundsRef.current.set(path, howl);
    }
    return howl;
  }, []);

  const play = useCallback((name: SoundName, volumeOverride?: number) => {
    if (!enabled) return;
    const howl = getSound(SOUND_PATHS[name]);
    howl.volume(volumeOverride ?? volume);
    howl.play();
  }, [enabled, volume, getSound]);

  const playBeltSound = useCallback((beltId: string) => {
    if (!enabled) return;
    const soundName = BELT_SOUNDS[beltId] || "wood-tap";
    const howl = getSound(SOUND_PATHS[soundName]);
    howl.volume(volume * 0.5);
    howl.play();
  }, [enabled, volume, getSound]);

  const startAmbient = useCallback((name: AmbientName) => {
    if (!enabled) return;
    if (ambientRef.current) {
      ambientRef.current.fade(ambientRef.current.volume(), 0, 800);
      setTimeout(() => { ambientRef.current?.stop(); }, 800);
    }
    const howl = new Howl({
      src: [AMBIENT_PATHS[name]],
      loop: true,
      volume: 0,
    });
    ambientRef.current = howl;
    howl.play();
    howl.fade(0, volume * 0.15, 1500);
  }, [enabled, volume]);

  const stopAmbient = useCallback(() => {
    if (ambientRef.current) {
      ambientRef.current.fade(ambientRef.current.volume(), 0, 1000);
      setTimeout(() => {
        ambientRef.current?.stop();
        ambientRef.current = null;
      }, 1000);
    }
  }, []);

  const toggleAudio = useCallback(() => {
    setEnabled((prev) => {
      const next = !prev;
      localStorage.setItem("dojo-audio", String(next));
      return next;
    });
  }, []);

  const setVolume = useCallback((v: number) => {
    setVolumeState(v);
    localStorage.setItem("dojo-volume", String(v));
  }, []);

  return (
    <AudioCtx.Provider value={{ enabled, volume, toggleAudio, setVolume, play, playBeltSound, startAmbient, stopAmbient }}>
      {children}
    </AudioCtx.Provider>
  );
}

export const useAudio = () => useContext(AudioCtx);
