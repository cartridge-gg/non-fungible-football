import type { ComponentStyleConfig } from "@chakra-ui/react";

export const Button: ComponentStyleConfig = {
  baseStyle: {
    gap: "10px",
    border: "2px solid",
    fontFamily: "IBM Plex Sans",
    borderRadius: "24px",
    letterSpacing: "0.01em",
  },
  variants: {
    mint: {
      borderColor: "mint.500",
      color: "mint.500",
      fontSize: "16px",
      py: "22px",
      px: "30px",
    },
    primary: {
      borderColor: "blue.100",
      color: "white",
      fontSize: "16px",
      py: "22px",
      px: "30px",
    },
    secondary: {
      borderColor: "blue.100",
      color: "blue.100",
      py: "22px",
      px: "30px",
    },
  },
  defaultProps: {
    variant: "primary",
  },
};
