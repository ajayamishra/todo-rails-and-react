import {
  Route,
  RouterProvider,
  createBrowserRouter,
  createRoutesFromElements,
} from 'react-router-dom';

import { HomePage } from '@/pages/home';

const createRuoter = () =>
  createBrowserRouter(
    createRoutesFromElements(
      <>
        <Route path='/' element={<HomePage />} />
      </>
    )
  );

export const AppRoutes = () => {
  const router = createRuoter();
  return <RouterProvider router={router} />;
};
