// Learn more about configuration options: https://github.com/johnste/finicky/wiki/Configuration

const LOCAL_REDIRECT_URI_PATTERN =
  /[?&]redirect_uri=http(:|%3A)(\/|%2F){2}(localhost|127\.0\.0\.1)([:\/&%]|$)/i;

const isGoogleLoginFromLocalCli = (url) =>
  url.host === "accounts.google.com" &&
  LOCAL_REDIRECT_URI_PATTERN.test(url.search);

export default {
  defaultBrowser: "Firefox Developer Edition",
  rewrite: [
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
      match: ["atlassian.net/*", "*.atlassian.net/*"],
      browser: "Google Chrome",
    },

    {
      match: ["bitbucket.org/*"],
      browser: "Google Chrome",
    },

    {
      match: "https://www.figma.com/file/*",
      browser: "Figma",
    },

    {
      match: "*.firebase.google.com/*",
      browser: "Google Chrome",
    },

    {
      match: isGoogleLoginFromLocalCli,
      browser: "Google Chrome",
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
      browser: "Google Chrome",
    },

    {
      match: "open.spotify.com/*",
      browser: "Spotify",
    },

    {
      match: [
        "zoom.us/*",
        finicky.matchHostnames(/.*\zoom.us/),
        /zoom.us\/j\//,
      ],
      browser: "us.zoom.xos",
    },
  ],
};
