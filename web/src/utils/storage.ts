import Cookies from "js-cookie";

const isSafari =
  typeof navigator !== "undefined" &&
  /^((?!chrome|android).)*safari/i.test(navigator.userAgent);

const Storage = {
  get: (key: string): any => {
    const item = JSON.parse(window.localStorage.getItem(key));
    if (!item && isSafari) {
      const existing = Cookies.get(key);

      if (typeof existing === "undefined") {
        return undefined;
      }

      return JSON.parse(existing);
    }

    return item;
  },
  set: (key: string, value: any) => {
    if (isSafari) {
      // get full domain
      let domain = document.domain;
      // truncate subdomains. only keep principal domain
      domain = domain
        .split(".")
        // keep only second and top level domains
        .splice(-2)
        .join(".");

      // add . at the beginning of the domain
      // to share cookie across subdomains
      domain = "." + domain;

      Cookies.set(key, JSON.stringify(value), { secure: true, domain });
    }

    window.localStorage.setItem(key, JSON.stringify(value));
  },
  remove: (key: string) => {
    if (isSafari) {
      Cookies.remove(key);
    }

    window.localStorage.removeItem(key);
  },
};

export default Storage;
