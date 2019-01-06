---
layout: post
title: "embedo - Social Media Embed Plugin"
categories: []
tags:
- github
- plugin
status: publish
type: post
published: true
image: "https://cdn01.onzu.com/2017/4/14/0/embedo.png"
meta: {}
comments: true
---

**Embedo** adds a layer on top of third party embed APIs while ensuring best practices and native guidelines for each component. It takes cares of resizing the container, emitting necessary events and with support for native and external options to be pass along.

### Docs: [Options](https://github.com/shobhitsharma/embedo/wiki/Options) / [API](https://github.com/shobhitsharma/embedo/wiki/API) / [Events](https://github.com/shobhitsharma/embedo/wiki/Events) / [Usage](https://github.com/shobhitsharma/embedo/wiki/Usage) / [Changelog](https://github.com/shobhitsharma/embedo/releases)

### What's currently supported?

- Facebook URLs containing page, post, photos, videos or comments
- Twitter URLs containing user timeline and tweets
- YouTube and Vimeo videos URLs
- Instagram URLs containing posts and videos
- Pinterest URLs containing board, profile and pins
- Google Maps URLs containing cordinates to a location
- Embeds other urls like Github Gists, Soundcloud, Spotify or PDF, MP4, Webm, ... as `iframe`
- Embeds any URL that fulfils HTTP access control (CORS) policy
- Extended plugin support for additonal oembed services
- Supports IE10+ and all modern browsers

---

## Installation

#### NPM / Yarn

```sh
$ npm install embedo --save
$ yarn add embedo
```

#### Bower

```sh
$ bower install embedo
```

#### CDN

Alternatively, import using CDN while updating `version` as per requirements from any script below:

```html
<script type="text/javascript" src="https://unpkg.com/embedo/embedo.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/embedo[@VERSION]/embedo.min.js"></script>
<script type="text/javascript" src="https://unpkg.com/embedo[@VERSION]/plugins/[@PLUGIN_NAME]/[@PLUGIN_NAME].embedo.min.js"></script>
```

## Setup

#### CommonJS / AMD

```js
import Embedo from '/path/to/vendor';

// Initialize once (prefer globally)
const embedo = new Embedo({
 facebook: {
    appId: 'my_app_id', // Enable facebook SDK
    version: 'v2.10'
  },
  twitter: true,  // Enable twitter SDK
  instagram: true,  // Enable instagram SDK
  pinterest: true  // Enable pinterest SDK,
  googlemaps: {
    key: 'my_api_key' // Enables google maps API
  }
});

// Then call .load() method from anywhere
embedo.load(<HTMLElement[object]>, <URL[string]>, <options[object]*optional>);

// OR Chaining methods and callback
embedo
  .load(HTMLElement, URL, options)
  .done(Function)
  .fail(Function)

// OR storing in a variable
let my_embedo = embedo.load(HTMLElement, URL)
my_embedo.done(Function);
my_embedo.fail(Function);
```

Also, an example can be [found here](https://codepen.io/shobhitsharma/pen/yojJZp).

#### HTML

```html
...

<body>
  <div data-embedo-url="[@URL_TO_EMBED]"></div>
  <div data-embedo-url="[@URL_TO_EMBED]" data-embedo-[@OPTION_KEY]]="[@OPTION_VALUE]"></div>
</body>

...

<script>
  new Embedo({
    facebook: {
      appId: 'my_app_id', // Enable facebook SDK
      version: 'v2.10'
    },
    twitter: true,  // Enable twitter SDK
    instagram: true,  // Enable instagram SDK
    pinterest: true  // Enable pinterest SDK,
    googlemaps: {
      key: 'my_api_key' // Enables google maps API
    }
  });
</script>
```

Also, an example can be [found here](https://github.com/shobhitsharma/embedo/blob/master/test/index.dom.html).

Embedo only works for public URI having no authentication required or promising cross-domain policies of the host. It uses oEmbed API endpoints for facebook, twitter, instagram and vimeo acting more as a wrapper around respective API which allows using existing field-value set as explained further in documentation.

## Quick Links

- [Demo or Live Test](https://shobhitsharma.github.io/embedo)
- [Codepen - Demo](https://codepen.io/shobhitsharma/pen/yojJZp)
- [Codepen - Article Demo](https://codepen.io/shobhitsharma/pen/JOPWvP)
- [Codepen - Using with React](https://codepen.io/shobhitsharma/pen/prOGzd)
- [CodeSandbox - Domify](https://codesandbox.io/s/qzv20jk55j)

## Facebook - Page, Posts or Comments

This supports only **public posts**, mostly Pages. If you see `settings` icon with a tooltip saying "Custom", that requires facebook authorization, so only `globe` icon ones should be embedded. 

The URL must contain the `pageId` or `pageUsername` and URL for photos, posts or videos should look or closer which support [this expression](https://www.regexpal.com/94994).

```bash
https://www.facebook.com/[FACEBOOK_HANDLE]
https://www.facebook.com/[FACEBOOK_HANDLE]/photos/[SESSION_OR_USER_SCOPE_ID]/[POST_ID_HERE]
https://www.facebook.com/[FACEBOOK_HANDLE]/posts/[POST_ID_HERE]
https://www.facebook.com/[FACEBOOK_HANDLE]/videos/[POST_ID_HERE]/
https://www.facebook.com/pages/[FACEBOOK_HANDLE]/posts/[POST_ID_HERE]
https://www.facebook.com/pages/[FACEBOOK_HANDLE]/videos/[POST_ID_HERE]
https://www.facebook.com/[FACEBOOK_HANDLE]/posts/[POST_ID_HERE]?comment_id=[COMMENT_ID]
https://www.facebook.com/[FACEBOOK_HANDLE]/posts/[POST_ID_HERE]?reply_comment_id=[REPLY_COMMENT_ID]
```

PS: If you're running this in headless browsers (eg. phantom) or demos on jsfiddle/codepen/etc, facebook SDK will throw security exception due to recent changes in their server. But it will work normally when script is imported.

**Resources**
- [oEmbed API Documentation](https://developers.facebook.com/docs/plugins/oembed-endpoints)

## Twitter - Tweets, Timelines and Grid

This is straightforward, the exact twitter URL can be embedded while passing options from oembed API.

```bash
https://twitter.com/[TWITTER_HANDLE]
https://twitter.com/[TWITTER_HANDLE]/status/[TWEET_ID]
https://twitter.com/[TWITTER_HANDLE]/timelines/[TIMELINE_ID]
```

**For Timeline embed:**

```js
embedo.load(HTMLElement, 'https://twitter.com/TwitterDev/timelines/539487832448843776')
```

**For Timeline Grid embed:**

```js
embedo.load(HTMLElement, 'https://twitter.com/TwitterDev/timelines/539487832448843776', {
  widget_type: 'grid'
})
```

**Resources**
- [Twitter timeline embed guidelines](https://dev.twitter.com/web/embedded-timelines)
- [Twitter for Websites Guidelines](https://dev.twitter.com/web/overview)

## Instagram Posts

Only posts can be embedded, no timeline. So your URL should be closer to this pattern:

```bash
https://www.instagram.com/p/[POST_ID_HERE]
```

**Resources**
- [Instagram Embed Guidelines](https://www.instagram.com/developer/embedding/)

## YouTube Videos

Supports URLs matching `/watch?v=` or `/embed` in URL should work. Avoid playlist(s) URL.

```bash
https://www.youtube.com/watch?v=[VIDEO_ID]
https://www.youtube.com/embed/[VIDEO_ID]
https://youtu.be/[VIDEO_ID]
```

## Vimeo

Supports URLs matching video or channel links.

```bash
https://vimeo.com/[VIDEO_ID]
https://vimeo.com/channels/[CHANNEL_HANDLE]/[VIDEO_ID]
```

## Pinterest

By default, supports Pins embed.

```bash
https://www.pinterest.com/pin/[PIN_ID]
https://www.pinterest(.co.uk|.de|ANY)/pin/[PIN_ID]/
```

**For Board embed:**

```js
embedo.load(HTMLElement, 'https://www.pinterest.com/pinterest/official-news/', {
  'data-pin-do': 'embedBoard',
  'data-pin-board-width': 400,
  'data-pin-scale-height': 240,
  'data-pin-scale-width': 80,
  'strict': true // To allow above size dimensions to be used
})
```

**For Profile embed:**

```js
embedo.load(HTMLElement, 'https://www.pinterest.com/pinterest/', {
  'data-pin-do': 'embedUser'
})
```

**Resources**
- [Pinterest Embed Guidelines](https://developers.pinterest.com/tools/widget-builder/?type=pin)

## Others

The external links, based upon detected mime gets embed either in `<iframe>` or `<video>` elements. These could be any URL possible which has public access or cross-domain disabled.

Its also possible to override the HTML Tag using:

```js
embedo.load(HTMLElement, 'https://my.awesome/url/here', { tagName: 'embed' })
```

