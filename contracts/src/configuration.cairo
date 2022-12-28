
%lang starknet

from starkware.cairo.common.registers import get_label_location


func lookup_config(team_index: felt, player_index: felt) -> (
    accessory: felt,
    beard: felt,
    body: felt,
    boot: felt,
    hair: felt,
    number: felt,
    team: felt
) {
    alloc_locals;
    let (addr) = get_label_location(data_start);
	let team = [addr + team_index * 7 + 6];
	let offset = team * 26 * 7 + player_index * 7;

    let accessory = [addr + offset];
    let beard = [addr + offset + 1];
    let body = [addr + offset + 2];
    let boot = [addr + offset + 3];
    let hair = [addr + offset + 4];
    let number = [addr + offset + 5];

    return (accessory=accessory, beard=beard, body=body, boot=boot, hair=hair, number=number, team=team);

	data_start:
	// team 0
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 1; // hair
	dw 0; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 27; // hair
	dw 1; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 9; // beard
	dw 3; // body
	dw 0; // boot
	dw 27; // hair
	dw 2; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 4; // hair
	dw 3; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 1; // beard
	dw 2; // body
	dw 0; // boot
	dw 5; // hair
	dw 4; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 2; // hair
	dw 5; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 6; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 11; // hair
	dw 7; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 8; // beard
	dw 3; // body
	dw 0; // boot
	dw 1; // hair
	dw 8; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 4; // hair
	dw 9; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 37; // hair
	dw 10; // number
	dw 0; // team
	// team 0
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 11; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 52; // hair
	dw 12; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 7; // beard
	dw 2; // body
	dw 0; // boot
	dw 22; // hair
	dw 13; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 13; // hair
	dw 14; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 3; // boot
	dw 24; // hair
	dw 15; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 16; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 33; // hair
	dw 17; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 2; // boot
	dw 2; // hair
	dw 18; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 26; // hair
	dw 19; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 24; // hair
	dw 20; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 2; // beard
	dw 2; // body
	dw 0; // boot
	dw 5; // hair
	dw 21; // number
	dw 0; // team
	// team 0
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 28; // hair
	dw 22; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 4; // hair
	dw 23; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 20; // hair
	dw 24; // number
	dw 0; // team
	// team 0
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 3; // boot
	dw 8; // hair
	dw 25; // number
	dw 0; // team
	// team 1
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 28; // hair
	dw 0; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 1; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 8; // hair
	dw 2; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 1; // hair
	dw 3; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 4; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 3; // hair
	dw 5; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 6; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 7; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 8; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 49; // hair
	dw 9; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 10; // number
	dw 1; // team
	// team 1
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 11; // number
	dw 1; // team
	// team 1
	dw 1; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 0; // hair
	dw 12; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 43; // hair
	dw 13; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 14; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 15; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 12; // hair
	dw 16; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 8; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 17; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 6; // hair
	dw 18; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 23; // hair
	dw 19; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 11; // hair
	dw 20; // number
	dw 1; // team
	// team 1
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 15; // hair
	dw 21; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 22; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 23; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 3; // hair
	dw 24; // number
	dw 1; // team
	// team 1
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 25; // number
	dw 1; // team
	// team 2
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 0; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 6; // hair
	dw 1; // number
	dw 2; // team
	// team 2
	dw 1; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 0; // hair
	dw 2; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 3; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 4; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 5; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 6; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 11; // beard
	dw 3; // body
	dw 1; // boot
	dw 9; // hair
	dw 7; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 8; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 14; // hair
	dw 9; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 11; // hair
	dw 10; // number
	dw 2; // team
	// team 2
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 11; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 12; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 2; // hair
	dw 13; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 14; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 1; // hair
	dw 15; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 16; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 17; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 1; // hair
	dw 18; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 19; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 1; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 20; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 21; // number
	dw 2; // team
	// team 2
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 22; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 6; // hair
	dw 23; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 5; // hair
	dw 24; // number
	dw 2; // team
	// team 2
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 25; // number
	dw 2; // team
	// team 3
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 2; // hair
	dw 0; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 9; // hair
	dw 1; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 2; // number
	dw 3; // team
	// team 3
	dw 1; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 51; // hair
	dw 3; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 50; // hair
	dw 4; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 26; // hair
	dw 5; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 6; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 15; // hair
	dw 7; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 45; // hair
	dw 8; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 6; // beard
	dw 2; // body
	dw 0; // boot
	dw 7; // hair
	dw 9; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 24; // hair
	dw 10; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 14; // hair
	dw 11; // number
	dw 3; // team
	// team 3
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 42; // hair
	dw 12; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 0; // hair
	dw 13; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 13; // hair
	dw 14; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 2; // boot
	dw 9; // hair
	dw 15; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 16; // hair
	dw 16; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 41; // hair
	dw 17; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 42; // hair
	dw 18; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 7; // hair
	dw 19; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 47; // hair
	dw 20; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 6; // hair
	dw 21; // number
	dw 3; // team
	// team 3
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 45; // hair
	dw 22; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 19; // hair
	dw 23; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 3; // boot
	dw 7; // hair
	dw 24; // number
	dw 3; // team
	// team 3
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 29; // hair
	dw 25; // number
	dw 3; // team
	// team 4
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 25; // hair
	dw 0; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 57; // hair
	dw 1; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 10; // hair
	dw 2; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 18; // hair
	dw 3; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 27; // hair
	dw 4; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 25; // hair
	dw 5; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 28; // hair
	dw 6; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 7; // number
	dw 4; // team
	// team 4
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 19; // hair
	dw 8; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 6; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 9; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 7; // hair
	dw 10; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 23; // hair
	dw 11; // number
	dw 4; // team
	// team 4
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 43; // hair
	dw 12; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 13; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 7; // hair
	dw 14; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 34; // hair
	dw 15; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 16; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 2; // boot
	dw 6; // hair
	dw 17; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 11; // hair
	dw 18; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 19; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 20; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 50; // hair
	dw 21; // number
	dw 4; // team
	// team 4
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 22; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 28; // hair
	dw 23; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 6; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 24; // number
	dw 4; // team
	// team 4
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 36; // hair
	dw 25; // number
	dw 4; // team
	// team 5
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 0; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 9; // hair
	dw 1; // number
	dw 5; // team
	// team 5
	dw 1; // accessory
	dw 2; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 2; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 20; // hair
	dw 3; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 35; // hair
	dw 4; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 28; // hair
	dw 5; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 6; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 5; // hair
	dw 7; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 6; // beard
	dw 1; // body
	dw 0; // boot
	dw 25; // hair
	dw 8; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 2; // hair
	dw 9; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 10; // number
	dw 5; // team
	// team 5
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 6; // hair
	dw 11; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 6; // hair
	dw 12; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 20; // hair
	dw 13; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 4; // hair
	dw 14; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 15; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 5; // hair
	dw 16; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 25; // hair
	dw 17; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 19; // hair
	dw 18; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 10; // beard
	dw 1; // body
	dw 0; // boot
	dw 49; // hair
	dw 19; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 20; // number
	dw 5; // team
	// team 5
	dw 2; // accessory
	dw 2; // beard
	dw 1; // body
	dw 0; // boot
	dw 24; // hair
	dw 21; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 22; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 3; // hair
	dw 23; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 4; // hair
	dw 24; // number
	dw 5; // team
	// team 5
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 6; // hair
	dw 25; // number
	dw 5; // team
	// team 6
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 0; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 1; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 21; // hair
	dw 2; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 50; // hair
	dw 3; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 40; // hair
	dw 4; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 5; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 1; // hair
	dw 6; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 50; // hair
	dw 7; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 8; // number
	dw 6; // team
	// team 6
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 32; // hair
	dw 9; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 38; // hair
	dw 10; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 53; // hair
	dw 11; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 26; // hair
	dw 12; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 11; // hair
	dw 13; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 14; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 15; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 16; // number
	dw 6; // team
	// team 6
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 19; // hair
	dw 17; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 18; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 19; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 8; // hair
	dw 20; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 9; // hair
	dw 21; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 22; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 23; // number
	dw 6; // team
	// team 6
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 15; // hair
	dw 24; // number
	dw 6; // team
	// team 6
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 28; // hair
	dw 25; // number
	dw 6; // team
	// team 7
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 16; // hair
	dw 0; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 56; // hair
	dw 1; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 5; // hair
	dw 2; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 3; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 29; // hair
	dw 4; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 5; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 41; // hair
	dw 6; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 42; // hair
	dw 7; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 38; // hair
	dw 8; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 9; // number
	dw 7; // team
	// team 7
	dw 1; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 52; // hair
	dw 10; // number
	dw 7; // team
	// team 7
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 11; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 12; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 11; // hair
	dw 13; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 14; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 43; // hair
	dw 15; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 46; // hair
	dw 16; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 56; // hair
	dw 17; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 0; // hair
	dw 18; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 24; // hair
	dw 19; // number
	dw 7; // team
	// team 7
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 36; // hair
	dw 20; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 37; // hair
	dw 21; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 34; // hair
	dw 22; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 10; // beard
	dw 0; // body
	dw 0; // boot
	dw 25; // hair
	dw 23; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 24; // number
	dw 7; // team
	// team 7
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 29; // hair
	dw 25; // number
	dw 7; // team
	// team 8
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 0; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 1; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 2; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 23; // hair
	dw 3; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 35; // hair
	dw 4; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 27; // hair
	dw 5; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 28; // hair
	dw 6; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 31; // hair
	dw 7; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 24; // hair
	dw 8; // number
	dw 8; // team
	// team 8
	dw 1; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 10; // hair
	dw 9; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 55; // hair
	dw 10; // number
	dw 8; // team
	// team 8
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 1; // hair
	dw 11; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 1; // hair
	dw 12; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 13; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 14; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 15; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 7; // beard
	dw 0; // body
	dw 1; // boot
	dw 42; // hair
	dw 16; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 10; // beard
	dw 0; // body
	dw 0; // boot
	dw 2; // hair
	dw 17; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 20; // hair
	dw 18; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 36; // hair
	dw 19; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 29; // hair
	dw 20; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 39; // hair
	dw 21; // number
	dw 8; // team
	// team 8
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 30; // hair
	dw 22; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 24; // hair
	dw 23; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 42; // hair
	dw 24; // number
	dw 8; // team
	// team 8
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 25; // hair
	dw 25; // number
	dw 8; // team
	// team 9
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 0; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 9; // hair
	dw 1; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 1; // hair
	dw 2; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 4; // hair
	dw 3; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 8; // hair
	dw 4; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 5; // hair
	dw 5; // number
	dw 9; // team
	// team 9
	dw 1; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 6; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 25; // hair
	dw 7; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 19; // hair
	dw 8; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 10; // beard
	dw 2; // body
	dw 0; // boot
	dw 49; // hair
	dw 9; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 10; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 4; // hair
	dw 11; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 12; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 20; // hair
	dw 13; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 20; // hair
	dw 14; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 35; // hair
	dw 15; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 7; // beard
	dw 3; // body
	dw 0; // boot
	dw 28; // hair
	dw 16; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 5; // hair
	dw 17; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 25; // hair
	dw 18; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 2; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 19; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 6; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 20; // number
	dw 9; // team
	// team 9
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 21; // number
	dw 9; // team
	// team 9
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 24; // hair
	dw 22; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 23; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 3; // hair
	dw 24; // number
	dw 9; // team
	// team 9
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 25; // number
	dw 9; // team
	// team 10
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 0; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 35; // hair
	dw 1; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 15; // hair
	dw 2; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 31; // hair
	dw 3; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 32; // hair
	dw 4; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 6; // hair
	dw 5; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 6; // beard
	dw 2; // body
	dw 1; // boot
	dw 9; // hair
	dw 6; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 24; // hair
	dw 7; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 29; // hair
	dw 8; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 1; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 9; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 28; // hair
	dw 10; // number
	dw 10; // team
	// team 10
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 20; // hair
	dw 11; // number
	dw 10; // team
	// team 10
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 49; // hair
	dw 12; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 15; // hair
	dw 13; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 8; // beard
	dw 1; // body
	dw 0; // boot
	dw 49; // hair
	dw 14; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 32; // hair
	dw 15; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 8; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 16; // number
	dw 10; // team
	// team 10
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 17; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 18; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 31; // hair
	dw 19; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 38; // hair
	dw 20; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 24; // hair
	dw 21; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 22; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 35; // hair
	dw 23; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 40; // hair
	dw 24; // number
	dw 10; // team
	// team 10
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 27; // hair
	dw 25; // number
	dw 10; // team
	// team 11
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 36; // hair
	dw 0; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 41; // hair
	dw 1; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 24; // hair
	dw 2; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 43; // hair
	dw 3; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 29; // hair
	dw 4; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 32; // hair
	dw 5; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 6; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 8; // hair
	dw 7; // number
	dw 11; // team
	// team 11
	dw 1; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 25; // hair
	dw 8; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 5; // hair
	dw 9; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 40; // hair
	dw 10; // number
	dw 11; // team
	// team 11
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 15; // hair
	dw 11; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 45; // hair
	dw 12; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 34; // hair
	dw 13; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 42; // hair
	dw 14; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 41; // hair
	dw 15; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 28; // hair
	dw 16; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 11; // hair
	dw 17; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 42; // hair
	dw 18; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 3; // hair
	dw 19; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 20; // number
	dw 11; // team
	// team 11
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 29; // hair
	dw 21; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 22; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 2; // hair
	dw 23; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 3; // boot
	dw 24; // hair
	dw 24; // number
	dw 11; // team
	// team 11
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 25; // number
	dw 11; // team
	// team 12
	dw 3; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 0; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 5; // hair
	dw 1; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 2; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 4; // hair
	dw 3; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 49; // hair
	dw 4; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 50; // hair
	dw 5; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 17; // hair
	dw 6; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 12; // hair
	dw 7; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 8; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 9; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 10; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 5; // beard
	dw 2; // body
	dw 0; // boot
	dw 50; // hair
	dw 11; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 12; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 50; // hair
	dw 13; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 1; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 14; // number
	dw 12; // team
	// team 12
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 36; // hair
	dw 15; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 19; // hair
	dw 16; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 17; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 3; // beard
	dw 1; // body
	dw 0; // boot
	dw 9; // hair
	dw 18; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 19; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 20; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 29; // hair
	dw 21; // number
	dw 12; // team
	// team 12
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 22; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 23; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 3; // boot
	dw 0; // hair
	dw 24; // number
	dw 12; // team
	// team 12
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 25; // number
	dw 12; // team
	// team 13
	dw 3; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 29; // hair
	dw 0; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 4; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 1; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 42; // hair
	dw 2; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 56; // hair
	dw 3; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 35; // hair
	dw 4; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 32; // hair
	dw 5; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 6; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 2; // hair
	dw 7; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 11; // hair
	dw 8; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 24; // hair
	dw 9; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 7; // hair
	dw 10; // number
	dw 13; // team
	// team 13
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 11; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 56; // hair
	dw 12; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 14; // beard
	dw 0; // body
	dw 2; // boot
	dw 48; // hair
	dw 13; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 23; // hair
	dw 14; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 2; // hair
	dw 15; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 31; // hair
	dw 16; // number
	dw 13; // team
	// team 13
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 36; // hair
	dw 17; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 44; // hair
	dw 18; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 20; // hair
	dw 19; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 20; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 21; // hair
	dw 21; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 46; // hair
	dw 22; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 32; // hair
	dw 23; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 1; // hair
	dw 24; // number
	dw 13; // team
	// team 13
	dw 0; // accessory
	dw 13; // beard
	dw 0; // body
	dw 0; // boot
	dw 56; // hair
	dw 25; // number
	dw 13; // team
	// team 14
	dw 2; // accessory
	dw 10; // beard
	dw 0; // body
	dw 0; // boot
	dw 42; // hair
	dw 0; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 22; // hair
	dw 1; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 45; // hair
	dw 2; // number
	dw 14; // team
	// team 14
	dw 1; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 41; // hair
	dw 3; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 4; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 24; // hair
	dw 5; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 21; // hair
	dw 6; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 1; // beard
	dw 1; // body
	dw 1; // boot
	dw 28; // hair
	dw 7; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 10; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 8; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 45; // hair
	dw 9; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 14; // beard
	dw 0; // body
	dw 1; // boot
	dw 48; // hair
	dw 10; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 44; // hair
	dw 11; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 46; // hair
	dw 12; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 47; // hair
	dw 13; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 14; // number
	dw 14; // team
	// team 14
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 16; // hair
	dw 15; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 18; // hair
	dw 16; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 45; // hair
	dw 17; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 18; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 41; // hair
	dw 19; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 3; // hair
	dw 20; // number
	dw 14; // team
	// team 14
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 21; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 16; // hair
	dw 22; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 21; // hair
	dw 23; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 47; // hair
	dw 24; // number
	dw 14; // team
	// team 14
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 46; // hair
	dw 25; // number
	dw 14; // team
	// team 15
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 27; // hair
	dw 0; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 49; // hair
	dw 1; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 2; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 1; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 3; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 35; // hair
	dw 4; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 35; // hair
	dw 5; // number
	dw 15; // team
	// team 15
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 6; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 7; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 24; // hair
	dw 8; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 37; // hair
	dw 9; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 15; // hair
	dw 10; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 9; // hair
	dw 11; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 12; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 2; // hair
	dw 13; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 0; // hair
	dw 14; // number
	dw 15; // team
	// team 15
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 15; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 16; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 1; // hair
	dw 17; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 2; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 18; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 8; // hair
	dw 19; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 4; // hair
	dw 20; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 2; // beard
	dw 2; // body
	dw 0; // boot
	dw 5; // hair
	dw 21; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 49; // hair
	dw 22; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 31; // hair
	dw 23; // number
	dw 15; // team
	// team 15
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 6; // hair
	dw 24; // number
	dw 15; // team
	// team 15
	dw 0; // accessory
	dw 3; // beard
	dw 2; // body
	dw 0; // boot
	dw 24; // hair
	dw 25; // number
	dw 15; // team
	// team 16
	dw 2; // accessory
	dw 9; // beard
	dw 2; // body
	dw 1; // boot
	dw 2; // hair
	dw 0; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 24; // hair
	dw 1; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 2; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 38; // hair
	dw 3; // number
	dw 16; // team
	// team 16
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 4; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 3; // boot
	dw 28; // hair
	dw 5; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 6; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 3; // hair
	dw 7; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 11; // hair
	dw 8; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 39; // hair
	dw 9; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 9; // hair
	dw 10; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 33; // hair
	dw 11; // number
	dw 16; // team
	// team 16
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 1; // hair
	dw 12; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 20; // hair
	dw 13; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 5; // beard
	dw 1; // body
	dw 0; // boot
	dw 23; // hair
	dw 14; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 15; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 36; // hair
	dw 16; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 2; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 17; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 10; // beard
	dw 1; // body
	dw 0; // boot
	dw 34; // hair
	dw 18; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 1; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 19; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 8; // hair
	dw 20; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 31; // hair
	dw 21; // number
	dw 16; // team
	// team 16
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 36; // hair
	dw 22; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 25; // hair
	dw 23; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 50; // hair
	dw 24; // number
	dw 16; // team
	// team 16
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 13; // hair
	dw 25; // number
	dw 16; // team
	// team 17
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 46; // hair
	dw 0; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 7; // hair
	dw 1; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 8; // hair
	dw 2; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 3; // hair
	dw 3; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 9; // hair
	dw 4; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 31; // hair
	dw 5; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 28; // hair
	dw 6; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 40; // hair
	dw 7; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 27; // hair
	dw 8; // number
	dw 17; // team
	// team 17
	dw 1; // accessory
	dw 1; // beard
	dw 2; // body
	dw 0; // boot
	dw 11; // hair
	dw 9; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 1; // hair
	dw 10; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 2; // boot
	dw 23; // hair
	dw 11; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 12; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 13; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 8; // beard
	dw 2; // body
	dw 1; // boot
	dw 12; // hair
	dw 14; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 3; // boot
	dw 50; // hair
	dw 15; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 11; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 16; // number
	dw 17; // team
	// team 17
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 49; // hair
	dw 17; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 18; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 38; // hair
	dw 19; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 5; // beard
	dw 2; // body
	dw 1; // boot
	dw 23; // hair
	dw 20; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 5; // hair
	dw 21; // number
	dw 17; // team
	// team 17
	dw 2; // accessory
	dw 8; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 22; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 3; // beard
	dw 2; // body
	dw 0; // boot
	dw 0; // hair
	dw 23; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 39; // hair
	dw 24; // number
	dw 17; // team
	// team 17
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 25; // number
	dw 17; // team
	// team 18
	dw 3; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 0; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 9; // hair
	dw 1; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 43; // hair
	dw 2; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 36; // hair
	dw 3; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 7; // hair
	dw 4; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 5; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 38; // hair
	dw 6; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 45; // hair
	dw 7; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 28; // hair
	dw 8; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 5; // beard
	dw 3; // body
	dw 1; // boot
	dw 50; // hair
	dw 9; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 46; // hair
	dw 10; // number
	dw 18; // team
	// team 18
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 11; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 4; // hair
	dw 12; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 13; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 29; // hair
	dw 14; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 15; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 50; // hair
	dw 16; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 5; // hair
	dw 17; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 49; // hair
	dw 18; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 11; // hair
	dw 19; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 20; // number
	dw 18; // team
	// team 18
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 27; // hair
	dw 21; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 43; // hair
	dw 22; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 16; // hair
	dw 23; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 22; // hair
	dw 24; // number
	dw 18; // team
	// team 18
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 25; // number
	dw 18; // team
	// team 19
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 1; // hair
	dw 0; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 4; // hair
	dw 1; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 5; // hair
	dw 2; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 49; // hair
	dw 3; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 1; // hair
	dw 4; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 3; // hair
	dw 5; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 38; // hair
	dw 6; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 49; // hair
	dw 7; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 47; // hair
	dw 8; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 18; // hair
	dw 9; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 11; // hair
	dw 10; // number
	dw 19; // team
	// team 19
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 31; // hair
	dw 11; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 3; // boot
	dw 41; // hair
	dw 12; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 44; // hair
	dw 13; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 36; // hair
	dw 14; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 17; // hair
	dw 15; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 39; // hair
	dw 16; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 22; // hair
	dw 17; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 47; // hair
	dw 18; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 19; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 44; // hair
	dw 20; // number
	dw 19; // team
	// team 19
	dw 1; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 1; // hair
	dw 21; // number
	dw 19; // team
	// team 19
	dw 2; // accessory
	dw 10; // beard
	dw 0; // body
	dw 1; // boot
	dw 25; // hair
	dw 22; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 8; // hair
	dw 23; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 0; // hair
	dw 24; // number
	dw 19; // team
	// team 19
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 36; // hair
	dw 25; // number
	dw 19; // team
	// team 20
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 1; // hair
	dw 0; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 1; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 49; // hair
	dw 2; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 41; // hair
	dw 3; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 4; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 12; // hair
	dw 5; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 42; // hair
	dw 6; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 34; // hair
	dw 7; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 8; // number
	dw 20; // team
	// team 20
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 9; // hair
	dw 9; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 23; // hair
	dw 10; // number
	dw 20; // team
	// team 20
	dw 2; // accessory
	dw 10; // beard
	dw 0; // body
	dw 0; // boot
	dw 36; // hair
	dw 11; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 29; // hair
	dw 12; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 41; // hair
	dw 13; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 31; // hair
	dw 14; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 28; // hair
	dw 15; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 32; // hair
	dw 16; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 49; // hair
	dw 17; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 18; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 5; // hair
	dw 19; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 10; // beard
	dw 0; // body
	dw 1; // boot
	dw 26; // hair
	dw 20; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 42; // hair
	dw 21; // number
	dw 20; // team
	// team 20
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 1; // hair
	dw 22; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 50; // hair
	dw 23; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 24; // number
	dw 20; // team
	// team 20
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 34; // hair
	dw 25; // number
	dw 20; // team
	// team 21
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 3; // boot
	dw 57; // hair
	dw 0; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 45; // hair
	dw 1; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 1; // hair
	dw 2; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 3; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 1; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 4; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 21; // hair
	dw 5; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 8; // hair
	dw 6; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 50; // hair
	dw 7; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 8; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 8; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 9; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 10; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 2; // hair
	dw 11; // number
	dw 21; // team
	// team 21
	dw 1; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 12; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 6; // beard
	dw 3; // body
	dw 1; // boot
	dw 14; // hair
	dw 13; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 53; // hair
	dw 14; // number
	dw 21; // team
	// team 21
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 42; // hair
	dw 15; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 7; // beard
	dw 2; // body
	dw 0; // boot
	dw 23; // hair
	dw 16; // number
	dw 21; // team
	// team 21
	dw 2; // accessory
	dw 1; // beard
	dw 1; // body
	dw 0; // boot
	dw 27; // hair
	dw 17; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 6; // hair
	dw 18; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 9; // beard
	dw 2; // body
	dw 0; // boot
	dw 14; // hair
	dw 19; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 4; // hair
	dw 20; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 21; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 13; // hair
	dw 22; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 18; // hair
	dw 23; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 43; // hair
	dw 24; // number
	dw 21; // team
	// team 21
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 21; // hair
	dw 25; // number
	dw 21; // team
	// team 22
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 8; // hair
	dw 0; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 23; // hair
	dw 1; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 2; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 0; // hair
	dw 3; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 4; // number
	dw 22; // team
	// team 22
	dw 1; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 15; // hair
	dw 5; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 10; // beard
	dw 2; // body
	dw 0; // boot
	dw 27; // hair
	dw 6; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 1; // hair
	dw 7; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 31; // hair
	dw 8; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 9; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 23; // hair
	dw 10; // number
	dw 22; // team
	// team 22
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 6; // hair
	dw 11; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 1; // hair
	dw 12; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 9; // hair
	dw 13; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 14; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 4; // hair
	dw 15; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 16; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 15; // hair
	dw 17; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 1; // hair
	dw 18; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 2; // beard
	dw 2; // body
	dw 0; // boot
	dw 3; // hair
	dw 19; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 23; // hair
	dw 20; // number
	dw 22; // team
	// team 22
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 35; // hair
	dw 21; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 22; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 23; // hair
	dw 23; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 49; // hair
	dw 24; // number
	dw 22; // team
	// team 22
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 22; // hair
	dw 25; // number
	dw 22; // team
	// team 23
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 26; // hair
	dw 0; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 29; // hair
	dw 1; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 3; // beard
	dw 1; // body
	dw 0; // boot
	dw 34; // hair
	dw 2; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 12; // beard
	dw 1; // body
	dw 0; // boot
	dw 28; // hair
	dw 3; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 4; // hair
	dw 4; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 35; // hair
	dw 5; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 42; // hair
	dw 6; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 9; // hair
	dw 7; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 7; // beard
	dw 1; // body
	dw 2; // boot
	dw 34; // hair
	dw 8; // number
	dw 23; // team
	// team 23
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 41; // hair
	dw 9; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 40; // hair
	dw 10; // number
	dw 23; // team
	// team 23
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 35; // hair
	dw 11; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 34; // hair
	dw 12; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 13; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 26; // hair
	dw 14; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 43; // hair
	dw 15; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 4; // hair
	dw 16; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 23; // hair
	dw 17; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 21; // hair
	dw 18; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 23; // hair
	dw 19; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 22; // hair
	dw 20; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 13; // hair
	dw 21; // number
	dw 23; // team
	// team 23
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 1; // hair
	dw 22; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 29; // hair
	dw 23; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 13; // hair
	dw 24; // number
	dw 23; // team
	// team 23
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 30; // hair
	dw 25; // number
	dw 23; // team
	// team 24
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 0; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 23; // hair
	dw 1; // number
	dw 24; // team
	// team 24
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 2; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 5; // beard
	dw 2; // body
	dw 0; // boot
	dw 49; // hair
	dw 3; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 14; // hair
	dw 4; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 1; // beard
	dw 2; // body
	dw 0; // boot
	dw 28; // hair
	dw 5; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 5; // beard
	dw 1; // body
	dw 0; // boot
	dw 24; // hair
	dw 6; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 57; // hair
	dw 7; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 46; // hair
	dw 8; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 10; // beard
	dw 2; // body
	dw 3; // boot
	dw 54; // hair
	dw 9; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 41; // hair
	dw 10; // number
	dw 24; // team
	// team 24
	dw 2; // accessory
	dw 1; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 11; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 10; // beard
	dw 0; // body
	dw 0; // boot
	dw 46; // hair
	dw 12; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 13; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 0; // hair
	dw 14; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 15; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 46; // hair
	dw 16; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 45; // hair
	dw 17; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 43; // hair
	dw 18; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 2; // boot
	dw 6; // hair
	dw 19; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 20; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 6; // beard
	dw 3; // body
	dw 1; // boot
	dw 3; // hair
	dw 21; // number
	dw 24; // team
	// team 24
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 22; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 4; // hair
	dw 23; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 31; // hair
	dw 24; // number
	dw 24; // team
	// team 24
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 3; // hair
	dw 25; // number
	dw 24; // team
	// team 25
	dw 2; // accessory
	dw 4; // beard
	dw 1; // body
	dw 0; // boot
	dw 0; // hair
	dw 0; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 1; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 11; // beard
	dw 1; // body
	dw 0; // boot
	dw 18; // hair
	dw 2; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 0; // hair
	dw 3; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 10; // hair
	dw 4; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 43; // hair
	dw 5; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 32; // hair
	dw 6; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 13; // beard
	dw 1; // body
	dw 0; // boot
	dw 41; // hair
	dw 7; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 1; // beard
	dw 1; // body
	dw 0; // boot
	dw 6; // hair
	dw 8; // number
	dw 25; // team
	// team 25
	dw 1; // accessory
	dw 2; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 9; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 7; // hair
	dw 10; // number
	dw 25; // team
	// team 25
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 14; // hair
	dw 11; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 5; // hair
	dw 12; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 31; // hair
	dw 13; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 11; // beard
	dw 1; // body
	dw 0; // boot
	dw 33; // hair
	dw 14; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 41; // hair
	dw 15; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 13; // beard
	dw 1; // body
	dw 0; // boot
	dw 42; // hair
	dw 16; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 4; // hair
	dw 17; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 6; // beard
	dw 1; // body
	dw 0; // boot
	dw 50; // hair
	dw 18; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 42; // hair
	dw 19; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 20; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 39; // hair
	dw 21; // number
	dw 25; // team
	// team 25
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 0; // hair
	dw 22; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 7; // beard
	dw 1; // body
	dw 0; // boot
	dw 2; // hair
	dw 23; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 32; // hair
	dw 24; // number
	dw 25; // team
	// team 25
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 40; // hair
	dw 25; // number
	dw 25; // team
	// team 26
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 18; // hair
	dw 0; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 50; // hair
	dw 1; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 48; // hair
	dw 2; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 43; // hair
	dw 3; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 36; // hair
	dw 4; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 50; // hair
	dw 5; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 6; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 33; // hair
	dw 7; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 3; // boot
	dw 19; // hair
	dw 8; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 8; // hair
	dw 9; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 38; // hair
	dw 10; // number
	dw 26; // team
	// team 26
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 42; // hair
	dw 11; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 6; // hair
	dw 12; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 6; // hair
	dw 13; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 46; // hair
	dw 14; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 47; // hair
	dw 15; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 32; // hair
	dw 16; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 10; // beard
	dw 1; // body
	dw 0; // boot
	dw 28; // hair
	dw 17; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 26; // hair
	dw 18; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 45; // hair
	dw 19; // number
	dw 26; // team
	// team 26
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 20; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 39; // hair
	dw 21; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 31; // hair
	dw 22; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 26; // hair
	dw 23; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 0; // hair
	dw 24; // number
	dw 26; // team
	// team 26
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 56; // hair
	dw 25; // number
	dw 26; // team
	// team 27
	dw 2; // accessory
	dw 5; // beard
	dw 3; // body
	dw 2; // boot
	dw 0; // hair
	dw 0; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 1; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 2; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 3; // hair
	dw 3; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 11; // hair
	dw 4; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 5; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 3; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 6; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 2; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 7; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 9; // hair
	dw 8; // number
	dw 27; // team
	// team 27
	dw 1; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 9; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 10; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 0; // hair
	dw 11; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 3; // hair
	dw 12; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 15; // hair
	dw 13; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 53; // hair
	dw 14; // number
	dw 27; // team
	// team 27
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 15; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 50; // hair
	dw 16; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 12; // hair
	dw 17; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 14; // beard
	dw 3; // body
	dw 0; // boot
	dw 5; // hair
	dw 18; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 10; // hair
	dw 19; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 26; // hair
	dw 20; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 49; // hair
	dw 21; // number
	dw 27; // team
	// team 27
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 22; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 23; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 2; // beard
	dw 3; // body
	dw 1; // boot
	dw 5; // hair
	dw 24; // number
	dw 27; // team
	// team 27
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 42; // hair
	dw 25; // number
	dw 27; // team
	// team 28
	dw 2; // accessory
	dw 1; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 0; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 23; // hair
	dw 1; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 2; // boot
	dw 9; // hair
	dw 2; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 1; // boot
	dw 28; // hair
	dw 3; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 3; // boot
	dw 9; // hair
	dw 4; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 40; // hair
	dw 5; // number
	dw 28; // team
	// team 28
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 25; // hair
	dw 6; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 3; // hair
	dw 7; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 2; // beard
	dw 1; // body
	dw 0; // boot
	dw 17; // hair
	dw 8; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 4; // hair
	dw 9; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 4; // hair
	dw 10; // number
	dw 28; // team
	// team 28
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 48; // hair
	dw 11; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 6; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 12; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 13; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 14; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 37; // hair
	dw 15; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 1; // boot
	dw 0; // hair
	dw 16; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 20; // hair
	dw 17; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 2; // beard
	dw 1; // body
	dw 0; // boot
	dw 45; // hair
	dw 18; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 37; // hair
	dw 19; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 23; // hair
	dw 20; // number
	dw 28; // team
	// team 28
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 9; // hair
	dw 21; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 13; // hair
	dw 22; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 8; // beard
	dw 1; // body
	dw 0; // boot
	dw 36; // hair
	dw 23; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 13; // hair
	dw 24; // number
	dw 28; // team
	// team 28
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 3; // hair
	dw 25; // number
	dw 28; // team
	// team 29
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 0; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 6; // hair
	dw 1; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 1; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 2; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 3; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 6; // hair
	dw 4; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 3; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 5; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 15; // hair
	dw 6; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 2; // beard
	dw 2; // body
	dw 0; // boot
	dw 2; // hair
	dw 7; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 45; // hair
	dw 8; // number
	dw 29; // team
	// team 29
	dw 1; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 0; // hair
	dw 9; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 10; // number
	dw 29; // team
	// team 29
	dw 2; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 50; // hair
	dw 11; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 6; // hair
	dw 12; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 49; // hair
	dw 13; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 9; // hair
	dw 14; // number
	dw 29; // team
	// team 29
	dw 2; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 14; // hair
	dw 15; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 2; // hair
	dw 16; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 53; // hair
	dw 17; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 3; // hair
	dw 18; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 57; // hair
	dw 19; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 0; // hair
	dw 20; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 7; // hair
	dw 21; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 3; // boot
	dw 23; // hair
	dw 22; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 1; // boot
	dw 0; // hair
	dw 23; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 50; // hair
	dw 24; // number
	dw 29; // team
	// team 29
	dw 0; // accessory
	dw 0; // beard
	dw 3; // body
	dw 0; // boot
	dw 15; // hair
	dw 25; // number
	dw 29; // team
	// team 30
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 2; // hair
	dw 0; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 26; // hair
	dw 1; // number
	dw 30; // team
	// team 30
	dw 1; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 1; // hair
	dw 2; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 57; // hair
	dw 3; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 1; // beard
	dw 0; // body
	dw 0; // boot
	dw 1; // hair
	dw 4; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 5; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 2; // boot
	dw 7; // hair
	dw 6; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 24; // hair
	dw 7; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 20; // hair
	dw 8; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 46; // hair
	dw 9; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 52; // hair
	dw 10; // number
	dw 30; // team
	// team 30
	dw 2; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 6; // hair
	dw 11; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 49; // hair
	dw 12; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 43; // hair
	dw 13; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 10; // beard
	dw 0; // body
	dw 0; // boot
	dw 32; // hair
	dw 14; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 2; // body
	dw 0; // boot
	dw 12; // hair
	dw 15; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 25; // hair
	dw 16; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 51; // hair
	dw 17; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 50; // hair
	dw 18; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 28; // hair
	dw 19; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 30; // hair
	dw 20; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 21; // hair
	dw 21; // number
	dw 30; // team
	// team 30
	dw 2; // accessory
	dw 4; // beard
	dw 1; // body
	dw 0; // boot
	dw 23; // hair
	dw 22; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 2; // boot
	dw 23; // hair
	dw 23; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 0; // beard
	dw 1; // body
	dw 0; // boot
	dw 41; // hair
	dw 24; // number
	dw 30; // team
	// team 30
	dw 0; // accessory
	dw 12; // beard
	dw 1; // body
	dw 0; // boot
	dw 16; // hair
	dw 25; // number
	dw 30; // team
	// team 31
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 18; // hair
	dw 0; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 1; // hair
	dw 1; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 4; // hair
	dw 2; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 3; // hair
	dw 3; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 24; // hair
	dw 4; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 8; // hair
	dw 5; // number
	dw 31; // team
	// team 31
	dw 1; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 31; // hair
	dw 6; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 24; // hair
	dw 7; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 38; // hair
	dw 8; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 49; // hair
	dw 9; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 50; // hair
	dw 10; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 35; // hair
	dw 11; // number
	dw 31; // team
	// team 31
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 47; // hair
	dw 12; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 39; // hair
	dw 13; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 36; // hair
	dw 14; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 5; // hair
	dw 15; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 12; // hair
	dw 16; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 2; // boot
	dw 50; // hair
	dw 17; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 21; // hair
	dw 18; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 24; // hair
	dw 19; // number
	dw 31; // team
	// team 31
	dw 2; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 25; // hair
	dw 20; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 52; // hair
	dw 21; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 17; // hair
	dw 22; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 31; // hair
	dw 23; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 0; // boot
	dw 33; // hair
	dw 24; // number
	dw 31; // team
	// team 31
	dw 0; // accessory
	dw 0; // beard
	dw 0; // body
	dw 1; // boot
	dw 38; // hair
	dw 25; // number
	dw 31; // team
}
