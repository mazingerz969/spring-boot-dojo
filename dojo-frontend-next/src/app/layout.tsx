import type { Metadata } from "next";
import { Outfit, JetBrains_Mono } from "next/font/google";
import "./globals.css";
import { AuthProvider } from "@/lib/auth-context";
import { AudioProvider } from "@/lib/audio";
import PageTransition from "@/components/ui/PageTransition";

const outfit = Outfit({
  subsets: ["latin"],
  variable: "--font-outfit",
});

const jetbrainsMono = JetBrains_Mono({
  subsets: ["latin"],
  variable: "--font-mono",
});

export const metadata: Metadata = {
  title: "Spring Dojo — Aprende Spring Boot construyendo",
  description: "Plataforma interactiva de aprendizaje de Spring Boot con microservicios",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es">
      <body className={`${outfit.variable} ${jetbrainsMono.variable} grain antialiased`}>
        <AuthProvider>
          <AudioProvider>
            <PageTransition>{children}</PageTransition>
          </AudioProvider>
        </AuthProvider>
      </body>
    </html>
  );
}
