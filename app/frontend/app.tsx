import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ReactQueryDevtools } from '@tanstack/react-query-devtools';

import { worker } from '@/mocks/browser';
import { AppRoutes } from '@/routes';
import { isAxiosError } from 'axios';

if (import.meta.env.DEV && import.meta.env.VITE_API_MOCK_ENABLED) {
  worker.start({
    onUnhandledRequest: 'bypass',
  });
}

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: (failureCount, error) => {
        if (isAxiosError(error)) {
          return false;
        }
        return failureCount < 3;
      },
    },
  },
});

export const MainApp = () => {
  return (
    <QueryClientProvider client={queryClient}>
      <ReactQueryDevtools initialIsOpen={false} />
      <AppRoutes />
    </QueryClientProvider>
  );
};
