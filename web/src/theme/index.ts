import { extendTheme } from "@chakra-ui/react";
import colors from "./colors";
import * as Components from "./components";

const theme = extendTheme({
  // config,
  colors,
  fonts: {
    body: "Poppins",
  },
  textStyles: {
    h1: {
      fontSize: "13px",
      fontWeight: "700",
      lineHeight: "24px",
      letterSpacing: "0.02em",
      textTransform: "uppercase",
    },
  },
  styles: {
    global: {
      body: {
        background: "blue.200",
        color: "white",
        fontSize: "13px",
        letterSpacing: "0.01em",
        WebkitTapHighlightColor: "transparent",
      },
    },
  },
  components: {
    ...Components,
  },
});

export default theme;
