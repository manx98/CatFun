import { defineConfig } from 'vite';
import path from 'path';

export default defineConfig({
  build: {
    outDir: '../../packages/xi/assets/js',
    lib: {
      entry: path.resolve(__dirname, 'src/main.js'),
      name: 'kitty',
      fileName: (format) => `kitty.${format}.js`,
      formats: ['umd']
    },
    rollupOptions: {
      external: [],
      output: {
        exports: 'named',
        inlineDynamicImports: true
      }
    }
  },
  define: {
    'process.env': {}
  }
});