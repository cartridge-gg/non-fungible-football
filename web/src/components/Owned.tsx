import Image from "next/future/image";
import { useState } from "react";
import {
  AspectRatio,
  Box,
  Flex,
  Text,
  HStack,
  VStack,
  Spacer,
} from "@chakra-ui/react";
import { MotionFlex } from "./MotionWrappers";
import { Toggle } from "./tourney";
import { CONTRACT_PLAYER } from "utils/constants";
import { useStarknet } from "@starknet-react/core";
import Soccerball from "./icons/Soccerball";

const CDN = `https://static.cartridge.gg/starknet:sn_goerli/${CONTRACT_PLAYER}`;

export const Owned = ({ tokenIds }: { tokenIds: Array<number> }) => {
  const [idx, setIdx] = useState<number>(0);

  const onNext = () => {
    setIdx(idx + 1);
    return idx + 1 === tokenIds.length - 1 ? false : true;
  };

  const onPrev = () => {
    setIdx(idx - 1);
    return idx - 1 === 0 ? false : true;
  };

  const bgImg =
    tokenIds.length === 0
      ? "url('/soccerball.svg') no-repeat center"
      : `url('${CDN}/${tokenIds[idx]}.svg') no-repeat center/100%`;
  return (
    <MotionFlex
      direction="column"
      w="180px"
      gap="10px"
      display={["none", "none", "flex"]}
    >
      <HStack w="full">
        <Text textStyle="bracket" color="whiteAlpha.400">
          {tokenIds.length} OWNED
        </Text>
        <Spacer />
        <Flex gap="20px">
          <Toggle
            size="sm"
            next={onNext}
            prev={onPrev}
            arrow={false}
            disabled={tokenIds.length <= 1}
            gap="5px"
          />
        </Flex>
      </HStack>
      <Box
        width="180px"
        height="180px"
        borderRadius="10px"
        boxShadow="0px 6px 10px rgba(0,0,0,0.2)"
        background={bgImg}
      />
      <VStack
        spacing="0"
        align="flex-start"
        visibility={tokenIds.length === 0 ? "visible" : "hidden"}
      >
        <Text textStyle="h1">Observer</Text>
        <Text textStyle="bracket" color="mint.500">
          Minting now open!
        </Text>
      </VStack>
    </MotionFlex>
  );
};
