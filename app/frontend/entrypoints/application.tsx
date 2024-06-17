import * as React from 'react';
import { createRoot } from 'react-dom/client';
import { MainApp } from '@/app';

import './application.css';

const container = document.getElementById('root');
if (container) {
  const root = createRoot(container);
  root.render(<MainApp />);
}
