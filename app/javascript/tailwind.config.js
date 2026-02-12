// tailwind.config.js
module.exports = {
  content: [
    './app/views/**/*.{erb,haml,html,slim}',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        'text': 'var(--color-text)',
        'background': 'var(--color-background)',
        'primary': 'var(--color-primary)',
        'secondary': 'var(--color-secondary)',
        'accent': 'var(--color-accent)'
      },
    },
  },
  plugins: [],
};
