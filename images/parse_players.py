#!/usr/bin/python

import csv
import random

HEADER = """
%lang starknet

from starkware.cairo.common.registers import get_label_location

"""

LOOKUP_FUC = """
func lookup_config(index: felt) -> (
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
    let offset = index * 7;

    let accessory = [addr + offset];
    let beard = [addr + offset + 1];
    let body = [addr + offset + 2];
    let boot = [addr + offset + 3];
    let hair = [addr + offset + 4];
    let number = [addr + offset + 5];
    let team = [addr + offset + 6];

    return (accessory=accessory, beard=beard, body=body, boot=boot, hair=hair, number=number, team=team);

	data_start:"""

output = HEADER

def get(v, n):
    if v == '':
        return random.randint(0, n)
    return int(v)

def get_beard(v):
    if random.randint(0, 100) > 70:
        return 0
    return get(v, 15)

def get_boots(v):
    if v != '':
        return int(v)

    r = random.randint(0, 100)
    if r > 96:
        return 3
    if r > 92:
        return 2
    if r > 79:
        return 1
    return 0

# name	team	body	hair	beard	number	boots	background	CAPTAIN	GK
if __name__ == "__main__":

    table = ""
    with open('players.csv', newline='') as csvfile:
        playerreader = csv.reader(csvfile)
        for row in playerreader:
            team = int(row[0])
            body = int(row[1]) - 1
            if body < 0:
                raise "invalid body"

            hair = get(row[2], 53)
            beard = get_beard(row[3])
            number = int(row[4]) - 1
            if number < 0:
                raise "invalid number"

            boot = get_boots(row[5])
            keeper = row[8]

            accessory = 0
            if keeper == 'CAPTAIN':
                accessory = 1

            if keeper == 'GK':
                accessory = 2

            if keeper == 'GK / CAPTAIN':
                accessory = 3

            table += "\n\tdw " + str(accessory) + ";"
            table += "\n\tdw " + str(beard) + ";"
            table += "\n\tdw " + str(body) + ";"
            table += "\n\tdw " + str(boot) + ";"
            table += "\n\tdw " + str(hair) + ";"
            table += "\n\tdw " + str(number) + ";"
            table += "\n\tdw " + str(team) + ";"

    output += LOOKUP_FUC
    output += table
    output += "\n}\n"

    with open('../contracts/src/configuration.cairo', 'w') as f:
        f.write(output)

    print("Operation finished. Have fun.")