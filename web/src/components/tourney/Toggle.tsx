import {
  Circle,
} from "@chakra-ui/react";
import ArrowIcon from "components/icons/Arrow";

export const Toggle = ({
  state,
  next,
  prev,
}: {
  state: boolean;
  next: () => void;
  prev: () => void;
}) => {
  return (
    <>
      <Circle
        as="button"
        size="48px"
        bg="blue.200"
        onClick={prev}
        opacity={state && "0.33"}
      >
        <ArrowIcon transform="rotate(180deg)" />
      </Circle>
      <Circle
        as="button"
        size="48px"
        bg="blue.200"
        onClick={next}
        opacity={!state && "0.33"}
      >
        <ArrowIcon />
      </Circle>
    </>
  );
};
