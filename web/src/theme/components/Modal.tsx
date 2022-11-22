import type { ComponentMultiStyleConfig } from "@chakra-ui/theme";

export const Modal: ComponentMultiStyleConfig = {
  parts: [
    "overlay",
    "dialogContainer",
    "dialog",
    "header",
    "closeButton",
    "body",
    "footer",
  ],
  baseStyle: {
    dialog: {
      background: "transparent",
      boxShadow: "none",
      bgColor: "blackAlpha.400",
      mt: "100px",
    },
    overlay: {
      bgColor: "blackAlpha.800",
    },
    footer: {
      pt: "0",
    },
  },
};
