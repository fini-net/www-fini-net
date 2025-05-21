# www-fini-net

Web site content for [https://www.fini.net/](https://www.fini.net/)

## Status

Rebuilding from the twiki/foswiki source code and turning it into a hugo site.
This is not currently the live site on [https://www.fini.net/](https://www.fini.net/)
but hopefully we will be live within a year.

It is viewable at [https://fini-net.github.io/www-fini-net/](https://fini-net.github.io/www-fini-net/),
but there's a lot that is still broken.

### Working

- Pull down fuller `justfile` from [www-chicks-net](https://github.com/chicks-net/www-chicks-net).
- Converted from TWiki (read the [notes](TWiki_Conversion_Notes.md))
- Generating with `hugo`
- GHA for `markdownlint`
- Content cleanups

## HOWTO contribute

This is basically a personal project, but I'm open to thoughtful contributions.

The [Code of Conduct](CODE_OF_CONDUCT.md) explains general expectations for contributors.

### Development process (inherited)

Check out the [local justfile](https://github.com/fini-net/www-fini-net/blob/main/justfile)
for the development process.

Once you run `just justsync` the `justfile` from [www-chicks-net](https://github.com/chicks-net/www-chicks-net)
will be downloaded and the
[development cycle from www-chicks-net](https://github.com/chicks-net/www-chicks-net?tab=readme-ov-file#development-cycle)
will work for this repo.
