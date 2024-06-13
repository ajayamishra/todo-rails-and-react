import { defineConfig } from 'orval';
import { formatModel } from './app/frontend/api/transformer/format-model';

export default defineConfig({
  private: {
    hooks: {
      afterAllFilesWrite: 'prettier --write',
    },
    input: {
      override: {
        transformer: (content) => formatModel(content),
      },
      target: './docs/api/private/src/root.yaml',
    },
    output: {
      clean: true,
      client: 'react-query',
      mock: true,
      mode: 'tags',
      override: {
        mock: {
          delay: 100,
        },
        mutator: {
          name: 'axiosInstance',
          path: '../../api/config.ts',
        },
      },
      prettier: true,
      target: './generated.ts',
      tsconfig: './tsconfig.json',
      tslint: true,
      workspace: './app/frontend/models/generated',
    },
  },
});
