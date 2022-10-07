# Non Fungible Football

![image](static/banner.jpeg)

Non Fungible Football is an onchain game that will take place during the World Cup 2022 (22 Nov to 20 Dec).

It's an NFT based game, where players randomly draw a player at the beginning of the tournament and progress through the tournament with the player they currently own.

## Rules

1. 1 Player == 1 NFT.
1. 32 national teams with 26 players each == 832 total players.
1. Once a team is knocked out, all its players are knocked out.
1. Holders of the championship teams players win a portion of the pot.

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

## Minting

Players will be auctioned off using a [Gradual Dutch Auction](https://www.paradigm.xyz/2022/04/gda). A percentage of proceeds from the player auction will accumulate into a pool (final prize).

Players will be revealed after the mint is complete, so you can't pick a player or team.

The winners will receive a trophy, which unlocks the final prize.
