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
      _hover: {
        bgColor: "mint.500",
        color: "blue.200",
      },
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
      color: "white",
      py: "22px",
      px: "30px",
      _hover: {
        bgColor: "blue.100",
      },
    },
  },
  defaultProps: {
    variant: "primary",
  },
};
