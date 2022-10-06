import { useEffect, useState } from "react";
import { defaultProvider } from "starknet";
import { CONTRACT_PLAYER } from "utils/constants";

export const usePlayer = () => {
  const [player, setPlayer] = useState();
  const [error, setError] = useState<Error>();
  const [loading, setLoading] = useState<boolean>(false);

  useEffect(() => {
    setLoading(true);
    fetchPlayer()
      .then()
      .catch((e) => setError(e))
      .finally(() => setLoading(false));
  }, []);

  return {
    player: player,
    error: error,
    loading: loading,
  };
};

const fetchPlayer = async (): Promise<void> => {
  return null;
};
