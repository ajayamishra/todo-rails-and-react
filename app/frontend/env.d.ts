/// <reference types="vite/client" />

declare module 'vite' {
  interface ImportMetaEnv {
    readonly VITE_API_BASE_URL: string;
    readonly VITE_API_MOCK_ENABLED: boolean;
  }
}
