import { worker } from '@/mocks/browser';

if (import.meta.env.DEV && import.meta.env.VITE_API_MOCK_ENABLED) {
  worker.start({
    onUnhandledRequest: 'bypass',
  });
}
export const MainApp = () => {
  return (
    <div>
      <h1>Hello World!</h1>
    </div>
  );
};
