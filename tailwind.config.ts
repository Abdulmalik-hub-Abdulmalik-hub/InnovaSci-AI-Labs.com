import type { Config } from 'tailwindcss';

const config: Config = {
  content: ['./app/**/*.{js,ts,jsx,tsx,mdx}', './src/**/*.{js,ts,jsx,tsx,mdx}', './components/**/*.{js,ts,jsx,tsx,mdx}'],
  theme: {
    extend: {
      colors: {
        science: { purple: '#6B21A8', purpleLight: '#9333EA', purpleDark: '#581C87' },
        brand: { deepBlue: '#0077C6', deepBlueLight: '#0099FF', deepBlueDark: '#005999' },
        empirical: { teal: '#0D9488', tealLight: '#14B8A6', tealDark: '#0F766E' },
        background: { slate950: '#070A13', slate900: '#0F172A', slate800: '#1E293B' },
        text: { slate200: '#E2E8F0', grey: '#75787B' },
      },
      fontFamily: { sans: ['Inter', 'system-ui', 'sans-serif'], serif: ['DM Serif Display', 'Georgia', 'serif'] },
      backgroundImage: { 'hero-gradient': 'linear-gradient(135deg, #6B21A8 0%, #0077C6 50%, #0D9488 100%)' },
    },
  },
  plugins: [],
};

export default config;
