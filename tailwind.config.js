const colors = require('tailwindcss/colors')


module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      backgroundImage: theme => ({
        'gb1': "url('app/assets/img/gb1.jpg')",
       })
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
