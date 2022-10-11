import {
  ButtonProps,
  Link,
  Circle,
  HStack,
  SquareProps,
  StyleProps,
} from "@chakra-ui/react";
import ArrowIcon from "components/icons/Arrow";
import CaretIcon from "components/icons/Caret";
import { ReactNode, useState } from "react";

export const Toggle = ({
  size = "md",
  arrow = true,
  disabled = false,
  next,
  prev,
  ...rest
}: {
  size?: "md" | "sm";
  arrow?: boolean;
  disabled?: boolean;
  next: () => boolean;
  prev: () => boolean;
} & StyleProps) => {
  const [hasNext, setHasNext] = useState(true);
  const [hasPrev, setHasPrev] = useState(false);

  const onPrev = () => {
    setHasPrev(prev());
    setHasNext(true);
  };

  const onNext = () => {
    setHasNext(next());
    setHasPrev(true);
  };
  return (
    <HStack {...rest} pointerEvents={disabled ? "none" : "auto"}>
      {arrow ? (
        <>
          <CircleButton
            size={size}
            onClick={onPrev}
            disabled={!hasPrev}
            opacity={hasPrev && !disabled ? "1" : "0.3"}
            transform="rotate(180deg)"
          >
            <ArrowIcon size={size} />
          </CircleButton>
          <CircleButton
            size={size}
            onClick={onNext}
            disabled={!hasNext}
            opacity={hasNext ? "1" : "0.3"}
          >
            <ArrowIcon size={size} />
          </CircleButton>
        </>
      ) : (
        <>
          <Link
            as="button"
            onClick={onPrev}
            disabled={!hasPrev}
            opacity={hasPrev ? "1" : "0.3"}
          >
            <CaretIcon size={size} transform="rotate(180deg)" />
          </Link>
          <Link
            as="button"
            onClick={onNext}
            disabled={!hasNext}
            opacity={hasNext && !disabled ? "1" : "0.3"}
          >
            <CaretIcon size={size} />
          </Link>
        </>
      )}
    </HStack>
  );
};

const CircleButton = ({
  children,
  size,
  ...rest
}: { children: ReactNode } & StyleProps & SquareProps & ButtonProps) => {
  return (
    <Circle
      as="button"
      bg="blue.200"
      size={size === "md" ? "48px" : "24px"}
      {...rest}
    >
      {children}
    </Circle>
  );
};
