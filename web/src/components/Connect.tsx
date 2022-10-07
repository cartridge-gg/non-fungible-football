import { useRouter } from "next/router";
import {
  Box,
  Text,
  Flex,
  HStack,
  VStack,
  Circle,
  Button,
} from "@chakra-ui/react";
import RunnerIcon from "../components/icons/Runner";
import CartridgeIcon from "../components/icons/Cartridge";
import LogoutIcon from "../components/icons/Logout";
import {
  useConnectors,
  useStarknet,
  useStarknetExecute,
  useStarknetInvoke,
} from "@starknet-react/core";
import { formatAddress } from "utils/contracts";
import { useEffect, useMemo, useCallback } from "react";
import { CONTRACT_ETH, CONTRACT_PLAYER, PLAYER_PRICE } from "utils/constants";

export const Connect = () => {
  const router = useRouter();
  const { account } = useStarknet();
  const { connect, disconnect, connectors } = useConnectors();

  const calls = useMemo(() => {
    const ethApprove = {
      contractAddress: CONTRACT_ETH,
      entrypoint: "approve",
      calldata: [CONTRACT_PLAYER, PLAYER_PRICE, "0"],
    };
    const mint = {
      contractAddress: CONTRACT_PLAYER,
      entrypoint: "purchase",
      calldata: [PLAYER_PRICE],
    };
    return [ethApprove, mint];
  }, [account]);

  const { data, loading, error, execute } = useStarknetExecute({ calls });

  useEffect(() => {
    if (data) {
      router.push(`/mint/${data}`);
    }
  }, [data]);

  return (
    <HStack
      h="full"
      align="center"
      justify={["space-around", "space-around", "flex-end"]}
      px={[0, 0, "48px"]}
      spacing="12px"
    >
      {account ? (
        <>
          <Circle
            as="button"
            size="46px"
            border="2px solid"
            borderColor="blue.100"
            display={["none", "none", "block"]}
            onClick={() => {
              disconnect();
            }}
          >
            <LogoutIcon />
          </Circle>
          <Button variant="secondary">
            <CartridgeIcon /> {formatAddress(account)}
          </Button>
          <Button
            variant="mint"
            onClick={() => {
              execute();
            }}
          >
            <RunnerIcon />
            Mint
          </Button>
        </>
      ) : (
        <Button
          onClick={() => {
            connect(connectors[0]);
          }}
        >
          <CartridgeIcon /> Connect
        </Button>
      )}
    </HStack>
  );
};
