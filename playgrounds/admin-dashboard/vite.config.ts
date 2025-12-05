import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  // need to configure this to enable run with Docker locally
  server: {
    host: 'localhost',
    port: 5173,
  },
})
