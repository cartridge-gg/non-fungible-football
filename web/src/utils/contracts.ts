import { shortString } from "starknet";
import { computeHashOnElements } from "starknet/dist/utils/hash";
import { BigNumberish } from "starknet/dist/utils/number";
import { toHex } from "starknet/utils/number";

export function formatAddress(addr: BigNumberish) {
  if (typeof addr === "number") {
    addr = "0x" + addr.toString(16);
  } else {
    addr = toHex(addr);
  }

  return addr.substr(0, 6) + "..." + addr.substr(-4);
}

export function calculateContractAddress(
  salt: BigNumberish,
  contractHash: BigNumberish,
  constructorCalldata: BigNumberish[],
  callerAddress: BigNumberish = 0,
): string {
  const CONTRACT_ADDRESS_PREFIX = shortString.encodeShortString(
    "STARKNET_CONTRACT_ADDRESS",
  );
  const constructorCalldataHash = computeHashOnElements(constructorCalldata);

  return computeHashOnElements([
    CONTRACT_ADDRESS_PREFIX,
    callerAddress,
    salt,
    contractHash,
    constructorCalldataHash,
  ]);
}
