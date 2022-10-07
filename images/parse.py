#!/usr/bin/python

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

import PIL.Image
import svgwrite
import os.path

SCALE = 5

HEADER = """
%lang starknet

from starkware.cairo.common.registers import get_label_location
from starkware.cairo.common.alloc import alloc

"""

LOOKUP_FUC = """
func lookup_{part}(index: felt) -> (part_len: felt, part: felt*) {{
    alloc_locals;
    let (addr) = get_label_location(data_start);

    let (mapping: felt*) = alloc();
    {mapping}

    let value = cast(addr + index, felt*);
    return (part_len=value[0], part=value+1);

	data_start:"""

output = HEADER

def rgb_to_hex(rgb):
    return '#%02x%02x%02x' % rgb

if __name__ == "__main__":
    for part in ["body", "boots", "hair", "numbers", "teams"]:

        files = [os.path.join(part, f) for f in
                    os.listdir(part)]
        files.sort()

        part_start = 0

        mapping = ""
        table = ""
        for i, img in enumerate(files):
            image = PIL.Image.open(img)
            image = image.convert("RGBA")
            (width, height) = image.size

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

                    if rgb_tuple[3] > 0:
                        opacity = rgb_tuple[3] / float(255)
                        if opacity != 1:
                            rects += svgdoc.rect(insert = ("{0}px".format(colcount * SCALE),
                                                            "{0}px".format(rowcount * SCALE)),
                                                size = ("5px", "5px"),
                                                fill = rgb_to_hex((rgb_tuple[0],
                                                                    rgb_tuple[1],
                                                                    rgb_tuple[2])),
                                                opacity = rgb_tuple[3]/float(255)).tostring()
                        else:
                            rects += svgdoc.rect(insert = ("{0}px".format(colcount * SCALE),
                                                            "{0}px".format(rowcount * SCALE)),
                                                size = ("5px", "5px"),
                                                fill = rgb_to_hex((rgb_tuple[0],
                                                                    rgb_tuple[1],
                                                                    rgb_tuple[2]))).tostring()

                    colcount = colcount + 1
                rowcount = rowcount + 1

            n = 30
            rects = rects.replace('"', '\\"')
            split = ["\n\tdw '" + rects[i:i+n] + "';" for i in range(0, len(rects), n)]
            num = len(split)

            mapping += """\n\tassert mapping[{}] = {};""".format(i, part_start)
            table += "\n\t// " + img + " " + str(num) + " " + str(part_start)
            table += "\n\tdw " + str(num) + ";"
            table += "".join(split)

            # Add one for the len
            part_start += num + 1

        output += LOOKUP_FUC.format(part=part, mapping=mapping)
        output += table
        output += "\n}\n"

    with open('../contracts/src/components.cairo', 'w') as f:
        f.write(output)

    print("Operation finished. Have fun with your SVG.")