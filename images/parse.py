#!/usr/bin/python

"""pixel2svg - Convert pixel art to SVG

   Copyright 2011 Florian Berger <fberger@florian-berger.de>
"""

# This file is part of pixel2svg.
#
# pixel2svg is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# pixel2svg is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with pixel2svg.  If not, see <http://www.gnu.org/licenses/>.

# Work started on Thu Jul 21 2011.

import argparse

import PIL.Image
import svgwrite
import os.path

VERSION = "0.3.0"

HEADER = """
%lang starknet

from starkware.cairo.common.registers import get_label_location

"""

LOOKUP_FUC = """
func lookup_{part}(index: felt) -> (part_len: felt, part: felt*) {{
    let (addr) = get_label_location(data_start);

    let mapping = alloc()
    {mapping}

    let value = cast(addr + index, felt*);
    return (part_len=value[0], part=value+1);

	data_start:"""

output = HEADER

if __name__ == "__main__":
    for part in ["body", "boots", "hair", "numbers", "teams"]:

        files = [os.path.join(part, f) for f in
                    os.listdir(part)]

        part_start = 0

        mapping = ""
        table = ""
        for i, img in enumerate(files):
            print("pixel2svg {0}".format(VERSION))
            print("Reading image file '{0}'".format(img))

            image = PIL.Image.open(img)

            print("Converting image to RGBA")

            image = image.convert("RGBA")

            (width, height) = image.size

            print("Image is {0}x{1}".format(width, height))

            rgb_values = list(image.getdata())

            svgdoc = svgwrite.Drawing(filename = os.path.splitext(img)[0] + ".svg",
                                    size = ("{0}px".format(width),
                                            "{0}px".format(height)))

            rowcount = 0

            rects = ""
            while rowcount < height:
                colcount = 0

                while colcount < width:
                    rgb_tuple = rgb_values.pop(0)

                    # Omit transparent pixels
                    #
                    if rgb_tuple[3] > 0:
                        rects += svgdoc.rect(insert = ("{0}px".format(colcount),
                                                        "{0}px".format(rowcount)),
                                            fill = svgwrite.rgb(rgb_tuple[0],
                                                                rgb_tuple[1],
                                                                rgb_tuple[2])).tostring()
                    colcount = colcount + 1
                rowcount = rowcount + 1

            n = 30
            split = ["\n\tdw '" + rects[i:i+n] + "';" for i in range(0, len(rects), n)]
            num = len(rects)
            
            mapping += """\n\tmapping[{}] = {}""".format(i, part_start)
            table += "\n\t// " + img + " " + str(num) + " " + str(part_start)
            table += "\n\tdw " + str(num) + ";"
            table += "".join(split)

            # Add one for the len
            part_start += num + 1

        output += LOOKUP_FUC.format(part=part, mapping=mapping)
        output += table
        output += "}\n"

    with open('../contracts/src/components.cairo', 'w') as f:
        f.write(output)

    print("Operation finished. Have fun with your SVG.")
