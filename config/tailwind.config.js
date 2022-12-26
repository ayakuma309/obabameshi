const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require("daisyui"),
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          primary: "#fdba74",
          secondary: "#fde68a",
          accent: "#d9f99d",
          neutral: "#3d4451",
          "base-100": "#ffffff",
        },
      },
      "wireframe",
    ],
  }
}
