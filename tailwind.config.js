const defaultTheme = require('tailwindcss/defaultTheme');

module.exports = {
    theme: {
        container: {
            center: true,
            padding: {
                DEFAULT: '1rem',
                sm: '2rem',
            },
        },
        screens: {
            'xs': '375px',
            ...defaultTheme.screens,
            '3xl': '1600px',
            '4xl': '1920px',
        },
        extend: {
            colors: {
                'green': 'var(--green)',
                'dark-green': 'var(--dark-green)',
                'dark-grey': 'var(--dark-grey)',
                'light-grey': 'var(--light-grey)',
                'lighter-grey': 'var(--lighter-grey)',
            },
            fontSize: {
                'nav': '1rem', // 16px for small screens
                'nav-lg': '0.9375rem', // 15px for large screens
                'h1': '4.5rem', // 72px for small screens
                'h1-md': '5.5rem', // 88px for medium screens
                'h1-lg': '6.222rem', // 100px for large screens
                'h2': '3.5rem', // 56px for small screens
                'h2-md': '4.25rem', // 68px for medium screens
                'h2-lg': '4.625rem', // 74px for large screens
                'h3': '1.875rem', // 30px for small screens
                'h3-md': '2rem', // 32px for medium screens
                'h3-lg': '2.222rem', // 36px for large screens
                'h4': '1.875rem', // 30px for small screens
                'h4-md': '2rem', // 32px for medium screens
                'h4-lg': '2.222rem', // 36px for large screens
                'h5': '1.3125rem', // 21px for small screens
                'h5-md': '1.375rem', // 22px for medium screens
                'h5-lg': '1.5rem', // 24px for large screens
                'h6': '1.125rem', // 18px for medium screens
                'h6-md': '1.125rem', // 18px for medium screens
                'h6-lg': '1.25rem', // 20px for large screens
                'header-intro': '1.125rem', // 18px for small screens
                'header-intro-md': '1.125rem', // 18px for medium screens
                'header-intro-lg': '1.25rem', // 20px for large screens
                'body-text': '1rem', // 16px for small screens
                'body-text-md': '1.05rem', // 17px for medium screens
                'body-text-lg': '1.125rem', // 18px for large screens
                'small-quote': '1rem', // 16px for small screens
                'small-quote-md': '1rem', // 16px for medium screens
                'small-quote-lg': '1.0625rem', // 11px for large screens
                'large-quote': '2rem', // 32px for small screens
                'large-quote-md': '2.25rem', // 36px for medium screens
                'large-quote-lg': '2.5rem', // 40px for large screens
                'button': '1rem', // 16px for small screens
                'button-md': '1.05rem', // 17px for medium screens
                'button-lg': '1.125rem', // 18px for large screens
            },
            lineHeight: {
                'nav': '1.2',
                'nav-lg': '1.2',
                'h1': '4.25rem', // 68px for small screens
                'h1-md': '5rem', // 80px for medium screens
                'h1-lg': '6rem', // 96px for large screens
                'h2': '3.5rem', // 56px for small screens
                'h2-md': '4.25rem', // 68px for medium screens
                'h2-lg': '4.5rem', // 72px for large screens
                'h3': '2.25rem', // 36px for small screens
                'h3-md': '2.25rem', // 36px for medium screens
                'h3-lg': '2.5rem', // 40px for large screens
                'h4': '2.25rem', // 36px for small screens
                'h4-md': '2.25rem', // 36px for medium screens
                'h4-lg': '2.5rem', // 40px for large screens
                'h5': '1.5rem', // 24px for small screens
                'h5-md': '1.5rem', // 24px for medium screens
                'h5-lg': '1.666rem', // 27px for large screens
                'h6': '1.25rem', // 24px for small screens
                'h6-md': '1.25rem', // 24px for medium screens
                'h6-lg': '1.5rem', // 27px for large screens
                'header-intro': '1.375rem', // 22px for small screens
                'header-intro-md': '1.375rem', // 22px for medium screens
                'header-intro-lg': '1.4375rem', // 23px for large screens
                'body-text': '1.25rem', // 20px for small screens
                'body-text-md': '1.25rem', // 20px for medium screens
                'body-text-lg': '1.375rem', // 22px for large screens
                'small-quote': '1.125rem', // 17px for small screens
                'small-quote-md': '1.125rem', // 17px for medium screens
                'small-quote-lg': '1.3125rem', // 21px for large screens
                'large-quote': '2.25rem', // 36px for small screens
                'large-quote-md': '2.25rem', // 36px for medium screens
                'large-quote-lg': '2.777rem', // 44px for large screens
                'button': '1.25rem', // 20px for small screens
                'button-md': '1.25rem', // 20px for medium screens
                'button-lg': '1.375rem', // 22px for large screens
            },
            fontFamily: {
                gilroy: ['gilroy', ...defaultTheme.fontFamily.sans],
                ppmori: ['ppmori', ...defaultTheme.fontFamily.sans],
            },
            borderWidth: {
                '1': '1px',
            },
            spacing: {
                '30': '7.5rem', // 120px
            },
        },
    },
    corePlugins: {
      container: false
    },
    plugins: [
        require('@tailwindcss/aspect-ratio'),
        function ({ addComponents }) {
            addComponents({
                '.container': {
                    maxWidth: '100%',
                    marginLeft: 'auto',
                    marginRight: 'auto',
                    paddingLeft: '1rem',
                    paddingRight: '1rem',

                    '@screen sm': {
                        maxWidth: '640px',
                    },
                    '@screen md': {
                        maxWidth: '768px',
                    },
                    '@screen lg': {
                        maxWidth: '1350px',
                        paddingLeft: '2rem',
                        paddingRight: '2rem',
                    },
                    '@screen xl': {
                        maxWidth: '1350px',
                    },
                }
            })
        },
    ],
    safelist: [],
    content: [
        './templates/**/*.{twig,html,js}',
        './src/**/*.{css,js}',
    ],
};
