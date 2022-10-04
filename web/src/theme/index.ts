import { extendTheme } from "@chakra-ui/react";
import colors from "./colors";
import * as Components from "./components";

const theme = extendTheme({
  // config,
  colors,
  fonts: {
    body: "Poppins",
  },
  styles: {
    global: {
      body: {
        background: "blue.200",
        WebkitTapHighlightColor: "transparent",
      },
    },
  },
  components: {
    ...Components,
  },
});

export default theme;
