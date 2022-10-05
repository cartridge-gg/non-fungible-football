import { Circle, HStack, StyleProps } from "@chakra-ui/react";
import ArrowIcon from "components/icons/Arrow";
import { useState } from "react";

export const Toggle = ({
  size = "md",
  next,
  prev,
  ...rest
}: {
  size?: "md" | "sm";
  next: () => boolean;
  prev: () => boolean;
} & StyleProps) => {
  const [hasNext, setHasNext] = useState(true);
  const [hasPrev, setHasPrev] = useState(false);
  return (
    <HStack {...rest}>
      <Circle
        as="button"
        size={size === "md" ? "48px" : "24px"}
        bg="blue.200"
        onClick={() => {
          setHasPrev(prev());
          setHasNext(true);
        }}
        disabled={!hasPrev}
        opacity={hasPrev ? "1" : "0.3"}
        transition="opacity 0.2s ease"
      >
        <ArrowIcon transform="rotate(180deg)" size={size} />
      </Circle>
      <Circle
        as="button"
        size={size === "md" ? "48px" : "24px"}
        bg="blue.200"
        onClick={() => {
          setHasNext(next());
          setHasPrev(true);
        }}
        disabled={!hasNext}
        opacity={hasNext ? "1" : "0.3"}
        transition="opacity 0.2s ease"
      >
        <ArrowIcon size={size} />
      </Circle>
    </HStack>
  );
};
