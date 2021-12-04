module.exports = {
  purge: [
    './app/**/*.html.erb',
    './app/helpers/*.erb',
    './app/javascript/**/*.js',
    './app/javascript/**/*.vue'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
