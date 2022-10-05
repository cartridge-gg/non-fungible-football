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

if __name__ == "__main__":


    # Notes for Python 3, once PIL supports it
    #
    argument_parser = argparse.ArgumentParser(description="Convert pixel art to SVG")
    
    argument_parser.add_argument("img",
                                help = "The image file to convert")
    
    argument_parser.add_argument("--overlap",
                                action = "store_true",
                                help = "If given, overlap vector squares by 1px")
    
    argument_parser.add_argument("--version",
                                action = "version",
                                version = VERSION,
                                help = "Display the program version")
    
    # arguments = argument_parser.parse_args()
    arguments = argument_parser.parse_args()

    if not len(arguments.img):
        argument_parser.print_help()

        raise SystemExit

    print("pixel2svg {0}".format(VERSION))
    print("Reading image file '{0}'".format(arguments.img))

    image = PIL.Image.open(arguments.img)

    print("Converting image to RGBA")

    image = image.convert("RGBA")

    (width, height) = image.size

    print("Image is {0}x{1}".format(width, height))

    rgb_values = list(image.getdata())

    print("Read {0} pixels".format(len(rgb_values)))

    svgdoc = svgwrite.Drawing(filename = os.path.splitext(arguments.img)[0] + ".svg",
                              size = ("{0}px".format(width),
                                      "{0}px".format(height)))

    rowcount = 0

    print("Will use an square overlap of {0}px".format(arguments.overlap))

    rects = ""
    while rowcount < height:

        print("Processing pixel row {0} of {1}".format(rowcount + 1, height))

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
    split = ["\n\t dw '" + rects[i:i+n] + "';" for i in range(0, len(rects), n)]

    with open(arguments.img+'.txt', 'w') as f:
        f.write("".join(split))

    print("Operation finished. Have fun with your SVG.")
