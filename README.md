# Cheat sheets

My personal cheat sheets. You can download the compiled versions on the [`gh-pages`](https://github.com/Vincevrp/cheat-sheets/tree/gh-pages) branch.

[![Travis (.com)](https://img.shields.io/travis/com/Vincevrp/cheat-sheets.svg?style=flat-square)](https://travis-ci.com/Vincevrp/cheat-sheets)
![GitHub last commit](https://img.shields.io/github/last-commit/Vincevrp/cheat-sheets.svg?style=flat-square)
[![GitHub license](https://img.shields.io/github/license/Vincevrp/cheat-sheets.svg?style=flat-square)](https://github.com/Vincevrp/cheat-sheets/blob/master/LICENSE)

## Building and configuration

Requires LaTeX, pandoc, and GNU Make.

Change settings in `templates/meta.yml` and/or add code to the header in `templates/header.tex`.

Build using Make:

```
make
```

Or build using docker-compose:

```
docker-compose up
```

This will generate a pdf version of the markdown files to the `docs/` folder.

## Credits and license

Inspired by [Bert Van Vreckem](https://github.com/bertvv).

The content of this project itself is licensed under the [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/), and the underlying source code used to format and display that content is licensed under the MIT license.
