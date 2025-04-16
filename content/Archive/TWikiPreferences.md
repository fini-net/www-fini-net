+++
title = 'TWikiPreferences'
date = 2007-09-28T13:13:00+00:00
draft = false
description = 'Converted from twiki - v1.7'
cover.hidden = true
#tags = []
+++

<table>
<tbody>
<tr>
<td>Site-level preferences are located in <a
href="%TWIKIWEB%.%TOPIC%">%TWIKIWEB%.%TOPIC%</a>, however this <a
href="%MAINWEB%.%TOPIC%">%MAINWEB%.%TOPIC%</a> prefs topic has overrride
priority and should be used for local customisations. This allows for
easier upgrades as you don't need to worry about the shipped preferences
clobbering yours. It's easier to keep a handle on if you only copy over
the settings you actually change.</td>
</tr>
</tbody>
</table>

<span class="twiki-macro EDITPREFERENCES">TWikiPreferencesForm</span>
*(Click for form-based editing of existing preferences.)*

- Web-specific background color: (is overwritten by web preferences)
- Set WEBBGCOLOR = \#[FFD8AA](FFD8AA "wikilink")

<!-- -->

- [favicon](http://en.wikipedia.org/wiki/Favicon): Attach a
  `favicon.ico` to a web's [WebPreferences](WebPreferences "wikilink")
  or add a `FAVICON` setting to
  [WebPreferences](WebPreferences "wikilink")
- Set FAVICON =
  %PUBURL%/%TWIKIWEB%/[FiniLogos](FiniLogos "wikilink")/favicon.ico

<!-- -->

- Set TABLEATTRIBUTES = tableborder="0" cellpadding="0" cellspacing="1"
  headerbg="#000099" headercolor="#FFFFCC" databg="#e3e3e3, \#f1f1f1"

<!-- -->

- Set WIKILOGOIMG =
  %PUBURL%/%TWIKIWEB%/[FiniLogos](FiniLogos "wikilink")/fini_logo.jpg
- Set WIKILOGOURL = <http://fini.net/>
- Set WIKILOGOALT = FINI home
- Set FINI =
  %NAVY%**FINI**%ENDCOLOR%<span class="twiki-macro IMAGE">Main/WebImages/fini_flag_icon.jpg</span>

<!-- -->

- Warn if `%<nop>INCLUDE{}%` of topic fails: Fail silently if empty or
  `off`. Output warning message (defined in templates/oopsalerts.tmpl)
  if set to `on`. Otherwise output specific text (use `$topic` for
  topic). You can override this in web preferences, or by using a
  `warn="..."` parameter with `%<nop>INCLUDE{}%` :
- Set INCLUDEWARNING = <span class="twiki-macro RED"></span> ***Note:***
  <span class="twiki-macro ENDCOLOR"></span> Included topic
  [$topic]($topic) does not exist yet

<!-- -->

- Vertical size of text edit box: (can be overwritten by user
  preferences)
- Set EDITBOXHEIGHT = 15

<!-- -->

- Set WIKIWEBLIST =
  [<span class="twiki-macro MAINWEB"></span>](%MAINWEB%.%HOMETOPIC%)
  <span class="twiki-macro SEP"></span>
  [<span class="twiki-macro TWIKIWEB"></span>](%TWIKIWEB%.%HOMETOPIC%)
  <span class="twiki-macro SEP"></span> [Sandbox](Sandbox.%HOMETOPIC%)
  <span class="twiki-macro SEP"></span> [College](College.%HOMETOPIC%)
  <span class="twiki-macro SEP"></span> [Plugins](Plugins.%HOMETOPIC%)
  <span class="twiki-macro SEP"></span> [Skins](Skins.%HOMETOPIC%)

<!-- -->

- Set WIKIWEBMASTER = <wikimaster@fini.net>
- Set SMTPMAILHOST = localhost
- Set SMTPSENDERHOST = wiki.fini.net

## Skin Settings

- Skin overriding the default TWiki templates: (can be overwritten by
  [WebPreferences](WebPreferences "wikilink") and user preferences)
- Set SKIN = pattern
- Set SKINSTYLE =

<!-- -->

- ***Note:*** See [TWikiSkinBrowser](TWikiSkinBrowser "wikilink") for
  currently installed skins

### [CynSkin](CynSkin "wikilink")

- Using attachments for styles:
- Set TWIKILAYOUTURL =
  %PUBURL%/%TWIKIWEB%/[PatternSkin](PatternSkin "wikilink")/layout.css
- Set TWIKISTYLEURL =
  %PUBURL%/%TWIKIWEB%/[PatternSkin](PatternSkin "wikilink")/style.css

<!-- -->

- Users or groups allowed to change or rename this %TOPIC% topic: (ex:
  <span class="twiki-macro MAINWEB"></span>.[TWikiAdminGroup](TWikiAdminGroup "wikilink"))
- Set ALLOWTOPICCHANGE =
  <span class="twiki-macro MAINWEB"></span>.[TWikiAdminGroup](TWikiAdminGroup "wikilink")
- Set ALLOWTOPICRENAME =
  <span class="twiki-macro MAINWEB"></span>.[TWikiAdminGroup](TWikiAdminGroup "wikilink")

<!-- -->

- Users or groups allowed to [create new webs](%TWIKIWEB%.ManagingWebs):
  (ex:
  <span class="twiki-macro MAINWEB"></span>.[TWikiAdminGroup](TWikiAdminGroup "wikilink"))
- Set ALLOWWEBMANAGE =
  <span class="twiki-macro MAINWEB"></span>.[TWikiAdminGroup](TWikiAdminGroup "wikilink")

## Preferences Control Settings

-  Allow topic level preferences, on or off: If set to `on`, topic
  preferences will be read, and will override any web- or site-level
  preferences not set as `FINALPREFERENCES`. By default, user
  preferences will override topic preferences.
- Set READTOPICPREFS = on

<!-- -->

- Topic level overrides user level preferences, on or off: If set to
  `on`, topic preferences will override user preferences. The user can
  in turn override this behavior by setting further `FINALPREFERENCES`
  in his or her user topic.
- Set TOPICOVERRIDESUSER = off

<!-- -->

- Site-level preferences that are **not** allowed to be overridden by
  %WEB

<!-- -->

- `FINALPREFERENCES` locks site-level preferences that are **not**
  allowed to be overridden by
  <span class="twiki-macro WEBPREFSTOPIC"></span> or user preferences:
- Set FINALPREFERENCES = ATTACHFILESIZELIMIT, PREVIEWBGIMAGE,
  WIKITOOLNAME, WIKIWEBMASTER, SMTPMAILHOST, SMTPSENDERHOST,
  ALLOWWEBMANAGE, PROXYHOST, PROXYPORT
