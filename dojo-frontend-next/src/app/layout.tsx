import type { Metadata } from "next";
import { Outfit, JetBrains_Mono } from "next/font/google";
import "./globals.css";
import { AuthProvider } from "@/lib/auth-context";
import { AudioProvider } from "@/lib/audio";
import PageTransition from "@/components/ui/PageTransition";
import Navbar from "@/components/ui/Navbar";
import ServiceWorkerRegister from "@/components/ServiceWorkerRegister";

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
  appleWebApp: {
    capable: true,
    statusBarStyle: "black-translucent",
    title: "Spring Dojo",
  },
  other: {
    "mobile-web-app-capable": "yes",
  },
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es">
      <head>
        <meta name="theme-color" content="#0d9488" />
        <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
        <link rel="apple-touch-icon" href="/icons/icon-192.png" />
      </head>
      <body className={`${outfit.variable} ${jetbrainsMono.variable} grain antialiased`}>
        <AuthProvider>
          <AudioProvider>
            <Navbar />
            <PageTransition>{children}</PageTransition>
          </AudioProvider>
          <ServiceWorkerRegister />
        </AuthProvider>
      </body>
    </html>
  );
}
