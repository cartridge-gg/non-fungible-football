import { extendTheme } from "@chakra-ui/react";
import colors from "./colors";

const theme = extendTheme({
  // config,
  colors,
  fonts: {
    // heading: "LD_Mono",
    // body: "IBM Plex Sans",
  },
  styles: {
    global: {
      body: {
        background: "gray.900",
        WebkitTapHighlightColor: "transparent",
      },
    },
  },
  // components: {
  //   ...Components,
  // },
});

export default theme;
