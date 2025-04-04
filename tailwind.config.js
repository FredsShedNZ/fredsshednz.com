// tailwind.config.js
/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: '#2C3E50', // Dark blue-gray
          light: '#34495E',
          dark: '#1A2530',
        },
        secondary: {
          DEFAULT: '#E67E22', // Orange
          light: '#F39C12',
          dark: '#D35400',
        },
        background: {
          DEFAULT: '#ECF0F1', // Light gray with blue tint
          dark: '#BDC3C7',
        },
        accent: '#27AE60', // Green
      },
      fontFamily: {
        sans: ['Inter', 'Helvetica', 'Arial', 'sans-serif'],
        display: ['Montserrat', 'Helvetica', 'Arial', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
