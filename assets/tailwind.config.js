// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require('tailwindcss/plugin')
const fs = require('fs')
const path = require('path')
// const { default: daisyui } = require('daisyui')

module.exports = {
  content: [
    './js/**/*.js',
    '../lib/allyourgym_web.ex',
    '../lib/allyourgym_web/**/*.*ex',
    '../deps/backpex/**/*.*ex'
  ],
  theme: {
    extend: {
      colors: {
        brand: '#FD4F00'
      },
      backgroundColor: {
        'scrollbar-gutter': 'var(--scrollbar-gutter-color, transparent)',
        'scrollbar-gutter-dark': 'var(--scrollbar-gutter-color-dark, #1A202C)' // Use your dark background color here
      }
    }
  },
  // daisyui: {
  //   themes: [
  //     {
  //       light: {
  //         ...require('daisyui/src/theming/themes').light,
  //         primary: '#1d4ed8',
  //         'primary-content': 'white',
  //         secondary: '#f39325',
  //         'secondary-content': 'white'
  //       }
  //     },
  //     'dark',
  //     'cyberpunk'
  //   ]
  // },
  daisyui: {
    themes: false
    //  [
    //   {
    //     light: {
    //       ...light,
    //       primary: '#1d4ed8',
    //       'primary-content': 'white',
    //       secondary: '#f39325',
    //       'secondary-content': 'white'
    //     }
    //   },
    //   'dark',
    //   'cyberpunk'
    // ]
  },
  plugins: [
    // commented out for backpex
    require('@tailwindcss/forms'),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    require('daisyui'),
    require('@tailwindcss/typography'),
    plugin(({ addVariant }) =>
      addVariant('phx-click-loading', [
        '.phx-click-loading&',
        '.phx-click-loading &'
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant('phx-submit-loading', [
        '.phx-submit-loading&',
        '.phx-submit-loading &'
      ])
    ),
    plugin(({ addVariant }) =>
      addVariant('phx-change-loading', [
        '.phx-change-loading&',
        '.phx-change-loading &'
      ]),
    plugin(function ({ matchComponents, theme }) {
      const iconsDir = path.join(__dirname, '../deps/heroicons/optimized')
      const values = {}
      const icons = [
        ['', '/24/outline'],
        ['-solid', '/24/solid'],
        ['-mini', '/20/solid'],
        ['-micro', '/16/solid']
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          const name = path.basename(file, '.svg') + suffix
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) }
        })
      })
      matchComponents({
        hero: ({ name, fullPath }) => {
          const content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, '')
          let size = theme('spacing.6')
          if (name.endsWith('-mini')) {
            size = theme('spacing.5')
          } else if (name.endsWith('-micro')) {
            size = theme('spacing.4')
          }
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            '-webkit-mask': `var(--hero-${name})`,
            mask: `var(--hero-${name})`,
            'mask-repeat': 'no-repeat',
            'background-color': 'currentColor',
            'vertical-align': 'middle',
            display: 'inline-block',
            width: size,
            height: size
          }
        }
      }, { values })
    })
    ),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function ({ matchComponents, theme }) {
      const iconsDir = path.join(__dirname, '../deps/heroicons/optimized')
      const values = {}
      const icons = [
        ['', '/24/outline'],
        ['-solid', '/24/solid'],
        ['-mini', '/20/solid'],
        ['-micro', '/16/solid']
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          const name = path.basename(file, '.svg') + suffix
          values[name] = { name, fullPath: path.join(iconsDir, dir, file) }
        })
      })
      matchComponents(
        {
          hero: ({ name, fullPath }) => {
            const content = fs
              .readFileSync(fullPath)
              .toString()
              .replace(/\r?\n|\r/g, '')
            let size = theme('spacing.6')
            if (name.endsWith('-mini')) {
              size = theme('spacing.5')
            } else if (name.endsWith('-micro')) {
              size = theme('spacing.4')
            }
            return {
              [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
              '-webkit-mask': `var(--hero-${name})`,
              mask: `var(--hero-${name})`,
              'mask-repeat': 'no-repeat',
              'background-color': 'currentColor',
              'vertical-align': 'middle',
              display: 'inline-block',
              width: size,
              height: size
            }
          }
        },
        { values }
      )
    })
  ]
}
