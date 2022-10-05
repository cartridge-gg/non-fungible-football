import { useEffect, useState } from "react";
import { defaultProvider } from "starknet";
import { toBN } from "starknet/dist/utils/number";
import { CONTRACT_TOURNAMENT } from "utils/constants";

export const TEAM_COUNT = 32;

export type TeamType = {
  name: string;
  group: string;
};

export const useTournament = () => {
  const [teams, setTeams] = useState<TeamType[]>([]);
  const [error, setError] = useState<Error>();
  const [loading, setLoading] = useState<boolean>(false);

  useEffect(() => {
    setLoading(true);
    fetchTeams()
      .then((teams) => setTeams(teams))
      .catch((e) => setError(e))
      .finally(() => setLoading(false));
  }, []);

  return {
    teams: teams,
    error: error,
    loading: loading,
  };
};

const fetchTeams = async (): Promise<TeamType[]> => {
  const teamIds = Array.from({ length: 32 }, (x, i) => i.toString());

  const raw = await defaultProvider.callContract({
    contractAddress: CONTRACT_TOURNAMENT,
    entrypoint: "teams",
    calldata: [String(TEAM_COUNT), ...teamIds],
  });

  raw.result.shift(); // remove length

  let teams: TeamType[] = [];

  raw.result.forEach((felt, idx) => {
    if (idx % 2 == 0) {
      const name = Buffer.from(felt.substring(2), "hex").toString();
      const group = Buffer.from(
        raw.result[idx + 1].substring(2),
        "hex",
      ).toString();
      teams.push({ name, group });
    }
  });
  return teams;
};
