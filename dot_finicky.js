// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

export default {
  defaultBrowser: "Firefox Developer Edition",
  rewrite: [
    {
      match: "x.com/*",
      url: (url) => {
        url.host = "xcancel.com";
        return url;
      },
    },
  ],
  options: {
    hideIcon: false,
    checkForUpdate: false,
  },
  handlers: [

    {
      match: ["apple.com*", "*.apple.com*"],
      browser: "Safari",
    },

    {
      match: [
	      "atlassian.net/*",
	      "*.atlassian.net/*",
      ],
      browser: "Google Chrome Canary",
    },


    {
      match: [
	      "bitbucket.org/*",
      ],
      browser: "Google Chrome Canary",
    },

    {
      match: "https://www.figma.com/file/*",
      browser: "Figma",
    },

    {
      match: "*.firebase.google.com/*",
      browser: "Google Chrome Canary",
    },

    {
      match: (url) => url.host.includes("meet.jit.si"),
      browser: {
        name: "Jitsi Meet",
        path: "/Applications/Jitsi Meet.app",
      },
      url: (url) => {
        return new URL(`jitsi-meet://${url.host}${url.pathname}`);
      },
      browser: "/Applications/Jitsi Meet.app",
    },

    {
      match: "*.microsoftonline.com/*",
      browser: "Google Chrome Canary"
    },

    {
      match: "open.spotify.com/*",
      browser: "Spotify",
    },

    {
      match: ["zoom.us/*", finicky.matchHostnames(/.*\zoom.us/), /zoom.us\/j\//],
      browser: "us.zoom.xos",
    },

  ],
};
