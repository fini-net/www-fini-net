# Notes on converting TWiki docs into Hugo Markdown

## Status of this document

This process did work for me, as seen in the git history.  There were some manual
steps before and after the automation, but the automation found in the `justfile`
took care of the bulk of it.  I have not tested the results in hugo yet.

Open questions: `none that are currently written down` :grinning:

## HOWTO

If your twiki markup is in the `content/` directory named `*.txt`, run
`just twiki2hugo` and you should end up with modified `txt` files and 
`md` files with the Hugo Markdown in the same directory.

## Details on aspects

### TOPICINFO

The date in the [`META:TOPICINFO`](https://www.twiki.org/cgi-bin/view/TWiki06x01/TWikiMetaData#META_TOPICINFO) is in unixdate format.

> date == integer, unix time, seconds since start 1970

### pandoc

Pandoc can convert TWiki into Markdown.

```
pandoc -f twiki -t commonmark test.txt
```

We should [use commonmark since it is the format hugo expects](https://github.com/jgm/pandoc/discussions/10739).

### Convert twiki/unix timestamps into ISO date/time

I ended up with this snippet to convert unix seconds since 1970 time into an ISO date/time:

```
TZ=UTC date -r $UNIX_TIME -Iminutes
```

Thanks to [Gilles](https://unix.stackexchange.com/a/2993/79839) for setting me on the right path.

I could have come up with a Perl way to do this, but this was clean enough that I
just shelled out of the Perl for the handy old school `date` command.

### Convert HTML arefs into Markdown-style links

The Perl for this conversion came from https://unix.stackexchange.com/a/582424/79839
which deserves a lot more upvotes than it has gotten at the time of this writing.
I was only the fourth upvote.  It just worked.  Simple cut and paste.  No AI.  Like magic.
