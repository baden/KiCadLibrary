#!/usr/bin/env python
# coding=utf-8

import argparse
import re

print "Изменение размеров после генерации компонента из картинки"

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('zoom', metavar='zoom', type=int, nargs=1,
                   help='zoom factor')
parser.add_argument('input', metavar='input', type=str, nargs=1,
                   help='input library')
parser.add_argument('output', metavar='output', type=str, nargs=1,
                   help='output library')

args = parser.parse_args()

input = args.input[0]
output = args.output[0]
zoom = args.zoom[0]

print "Convert", input, "to", output, "with zoom:", zoom, "..."

prog = re.compile("\(xy\s([0-9.\-]+)\s([0-9.\-]+)\)")

def replace_sub(match):
    x = float(match.group(1)) / zoom
    y = float(match.group(2)) / zoom
    return "(xy {} {})".format(x,y)

i = open(input, 'r')
o = open(output, 'w')
for line in i:
    o.write( prog.sub(replace_sub, line) )
o.close()
