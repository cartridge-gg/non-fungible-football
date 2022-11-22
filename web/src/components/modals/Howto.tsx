import {
  Text,
  Modal,
  ModalBody,
  ModalContent,
  ModalOverlay,
  ModalHeader,
  ModalFooter,
  ModalCloseButton,
  VStack,
  HStack,
  UseDisclosureProps,
  useBreakpointValue,
} from "@chakra-ui/react";

import RunnerIcon from "components/icons/Runner";

export const Howto = ({ isOpen, onClose }: UseDisclosureProps) => {
  const isMobile = useBreakpointValue([true, true, false]);
  return (
    <>
      <Modal isOpen={isOpen} onClose={onClose} isCentered={isMobile}>
        <ModalOverlay />
        <ModalContent>
          <ModalHeader
            textTransform="uppercase"
            fontSize="14px"
            alignSelf="center"
          >
            How it works
          </ModalHeader>
          <ModalBody>
            <ModalCloseButton />
            <VStack spacing="20px" align="flex-start">
              <HStack align="flex-start">
                <RunnerIcon />
                <Text>
                  <strong>MINT:</strong> Participants will mint their Player
                  NFTs on 11/16/2022 at 12:30 ET / 9:30 PT
                </Text>
              </HStack>
              <HStack align="flex-start">
                <RunnerIcon />
                <Text>
                  <strong>TRADE:</strong> Player NFTS can be traded on Aspect
                </Text>
              </HStack>
              <HStack align="flex-start">
                <RunnerIcon />
                <Text>
                  <strong>WIN:</strong> The owners of each of the 26 Player NFTs
                  from the winning team of the World Cup finals on 18 December
                  2022 will be rewarded with a World Cup Trophy NFT
                </Text>
              </HStack>
            </VStack>
          </ModalBody>
          <ModalFooter></ModalFooter>
        </ModalContent>
      </Modal>
    </>
  );
};
