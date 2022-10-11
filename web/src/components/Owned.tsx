import Image from "next/future/image";
import { useState, useEffect, useCallback } from "react";
import { Text, HStack, Spacer, StyleProps } from "@chakra-ui/react";
import { MotionFlex } from "./MotionWrappers";
import { Toggle } from "./tourney";
import { CONTRACT_PLAYER } from "utils/constants";
import { useStarknet } from "@starknet-react/core";

const CDN = `https://static.cartridge.gg/starknet:sn_goerli/${CONTRACT_PLAYER}`;

export const Owned = ({ tokenIds }: { tokenIds: Array<number> }) => {
  const { account } = useStarknet();
  const [idx, setIdx] = useState<number>(0);

  const onNext = () => {
    setIdx(idx + 1);
    return idx + 1 === tokenIds.length - 1 ? false : true;
  };

  const onPrev = () => {
    setIdx(idx - 1);
    return idx - 1 === 0 ? false : true;
  };

  if (tokenIds.length === 0 || !account) {
    return <></>;
  }

  return (
    <MotionFlex direction="column" w="full" pl="60px" gap="10px">
      <HStack w="full">
        <Text textStyle="bracket" color="whiteAlpha.400">
          {tokenIds.length} OWNED
        </Text>
        <Spacer />
        {tokenIds.length > 1 && (
          <MotionFlex gap="20px">
            <Toggle size="sm" next={onNext} prev={onPrev} arrow={false} />
          </MotionFlex>
        )}
      </HStack>
      <Image
        width="300"
        height="300"
        src={`${CDN}/${tokenIds[idx]}.svg`}
        alt="image"
        style={{
          borderRadius: "10px",
          userSelect: "none",
          boxShadow: "0px 6px 10px rgba(0,0,0,0.2)",
        }}
      />
    </MotionFlex>
  );
};
