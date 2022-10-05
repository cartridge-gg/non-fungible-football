import NextLink from "next/link";
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
import { useConnectors, useAccount } from "@starknet-react/core";
import { formatAddress } from "utils/contracts";

export const Connect = () => {
  const { account } = useAccount();
  const { connect, disconnect, connectors } = useConnectors();
  return (
    <HStack h="full" align="center" justify="flex-end" px="48px" spacing="12px">
      {account ? (
        <>
          <Circle
            size="46px"
            border="2px solid"
            borderColor="blue.100"
            as="button"
            onClick={() => {
              disconnect();
            }}
          >
            <LogoutIcon />
          </Circle>
          <Button variant="secondary">
            <CartridgeIcon /> {formatAddress(account.address)}
          </Button>

          <NextLink href="/mint">
            <Button variant="mint">
              <RunnerIcon />
              Mint
            </Button>
          </NextLink>
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
