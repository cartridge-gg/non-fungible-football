import { useRouter } from "next/router";
import {
  Box,
  Text,
  Flex,
  HStack,
  VStack,
  Circle,
  Button,
  StyleProps,
  useToast,
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
import { useEffect, useMemo, useCallback, useState } from "react";
import { CONTRACT_ETH, CONTRACT_PLAYER, PLAYER_PRICE } from "utils/constants";

export const Connect = (props: StyleProps) => {
  const router = useRouter();
  const { account } = useStarknet();
  const { connect, disconnect, connectors } = useConnectors();
  const toast = useToast();

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

  const onConnect = useCallback(() => {
    if (connectors.length === 0) {
      if (!toast.isActive("wallet-toast")) {
        toast({
          id: "wallet-toast",
          position: "bottom-right",
          render: () => (
            <Box bg="red.500" p="20px" borderRadius="5px">
              <Text textStyle="boldUpper">No Wallets Detected</Text>
            </Box>
          ),
        });
      }
      return;
    }
    connect(connectors[0]);
  }, []);

  return (
    <HStack
      justify={["space-around", "space-around", "flex-end"]}
      spacing="12px"
      {...props}
    >
      {account ? (
        <>
          <Button variant="secondary">
            <CartridgeIcon /> {formatAddress(account)}
          </Button>
          <Circle
            as="button"
            size="46px"
            border="2px solid"
            borderColor="blue.100"
            display={["none", "none", "block"]}
            onClick={disconnect}
          >
            <LogoutIcon />
          </Circle>
        </>
      ) : (
        <Button onClick={onConnect}>
          <CartridgeIcon /> Connect
        </Button>
      )}
    </HStack>
  );
};
