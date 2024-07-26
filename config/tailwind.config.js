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
        'roboto-mono': ['Roboto Mono', 'monospace'],
        'krona': ['"Krona One"', 'sans-serif'],
        'prompt': ['Prompt', 'sans-serif']
      },
      fontWeight: {
        '100': '100',
        '200': '200',
        '300': '300',
        '400': '400',
        '500': '500',
        '600': '600',
        '700': '700',
        '800': '800',
        '900': '900',
      },
      colors: {
        'black-stroke': '#000000',
        'custom-stroke': '#faecea',
        'custom-button': '#de9d93',
        'custom-enhanced-border': '#ffdc5f',
        'custom-text': '#de9d93',
        'custom-text-card': '#777777',
        'custom-focus-color': '#de9d93',
      },
      height: {
        '10vh': '10vh',
        '20vh': '20vh',
        '30vh': '30vh',
        '40vh': '40vh',
        '50vh': '50vh',
        '60vh': '60vh',
        '70vh': '70vh',
        '80vh': '80vh',
        '90vh': '90vh',
        '100vh': '100vh',        
      }
      
    },
  },
  variants: {
    extend: {
      borderColor: ['focus'],
      outline: ['focus'],
      borderRadius: {
        '4xl': '2rem', 
      },
    },

  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
