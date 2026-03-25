import type { MetadataRoute } from 'next'

export default function manifest(): MetadataRoute.Manifest {
  return {
    name: 'Spring Dojo — Aprende Spring Boot',
    short_name: 'Spring Dojo',
    description: 'Plataforma interactiva de aprendizaje de Spring Boot con microservicios',
    start_url: '/',
    display: 'standalone',
    background_color: '#0c0c0f',
    theme_color: '#0d9488',
    orientation: 'portrait',
    categories: ['education', 'developer tools'],
    icons: [
      {
        src: '/icons/icon-192.png',
        sizes: '192x192',
        type: 'image/png',
      },
      {
        src: '/icons/icon-512.png',
        sizes: '512x512',
        type: 'image/png',
      },
      {
        src: '/icons/icon-512.png',
        sizes: '512x512',
        type: 'image/png',
        purpose: 'maskable',
      },
    ],
  }
}
