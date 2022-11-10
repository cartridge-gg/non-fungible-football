# Non Fungible Football

![image](static/banner.jpeg)

Non Fungible Football is an onchain game that will take place during the World Cup 2022 (22 Nov to 20 Dec).

It's an NFT based game, where players randomly draw a player at the beginning of the tournament and progress through the tournament with the player they currently own.

## Rules

1. 1 Player == 1 NFT.
1. 32 national teams with 26 players each == 832 total players.
1. Once a team is knocked out, all its players are knocked out.
1. Holders of the championship teams players win the championship.

## Implementation

Everything is stored onchain. Player NFT's, the tournament results, the tournament logic. We take advantage of Starknet computational abilities to resolve the tournament. Fixture results are commited by an oracle (soon to be a vote by players).

### Onchain Rendering

Player images are fully rendered onchain. In order to do so, preprocessing of the image parts is done in `images/parse.py`. The script outputs a cairo library with lookup functions which return each part split into `felt*`.

For example:
```cairo
func lookup_body(index: felt) -> (part_len: felt, part: felt*) {
    let (addr) = get_label_location(data_start);

    let mapping = alloc()
    
	mapping[0] = 0
	mapping[1] = 13376
	mapping[2] = 27011
	mapping[3] = 40544

    let value = cast(addr + index, felt*);
    return (part_len=value[0], part=value+1);

	data_start:
	// body/skin_04.png 13375 0
	dw 13375;
	dw '<rect fill="rgb(112,71,47)" he';
	dw 'ight="1" width="1" x="31px" y=';
	dw '"17px" /><rect fill="rgb(112,7';
    ...
}
```

### Oracle

Currently the tournament relies on an oracle for game outcomes. In the future, we would like to gamify this aspect. The mechanism would work as follows:

1. One of the teams participating in a match can propose an outcome (score).
1. All teams not participating can vote y/n to confirm the score.
1. If the score is overturned, the proposers NFT is burned.
1. Participants are rewarded for proposals / votes inline with the confirmed outcome with a portion of the pot.

### Bracket resolution

Once the group stage has been finalized, the knockout bracket is seeded. The tournament contract computes the outcome of the tournament onchain, based on each individual game outcome (i.e. implements the official tournament rules).

### Minting

Players will be revealed after the mint is complete, so you can't pick a player or team.

The winners will receive a trophy, which unlocks the final prize.

## Development

### Testing

```
protostar test tests
```

### Deployment

```
protostar build
protostar declare ./build/proxy.json --network=testnet
protostar declare ./build/player.json --network=testnet
protostar declare ./build/tournament.json --network=testnet
```

Proxy Class Hash: `0x01067c8f4aa8f7d6380cc1b633551e2a516d69ad3de08af1b3d82e111b4feda4`

Player Class Hash: `0x064f2b0e41576d9bd4bcb99c2ca244c470da76204d360b2f8214cbd317a17286`

Tournament Class Hash: `0x06994d18b6cd2106cac9fc1aa1acf6472274430d0cff0c705ef1c758b9426a5e`

## Credits

Mr Fax (art)
Click_save / Sobriquet (design)
Broody (web)
Tarrence (contracts)