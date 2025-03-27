# Notes on converting TWiki docs into Hugo Markdown

Open questions:

* Does it make any difference which Markdown output format we pick?
* How can you convert HTML arefs into Markdown-style links?

## TOPICINFO

The date in the META:TOPICINFO is in unixdate format.

> date == integer, unix time, seconds since start 1970

## pandoc

Pandoc can convert TWiki into Markdown.

```
pandoc -f twiki -t markdown test.txt
```
