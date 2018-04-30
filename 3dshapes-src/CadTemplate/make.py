# coding: utf-8

import sys
# sys.path.append("../../tools")
sys.path.append("tools")
import generator
import cadquery as cq

# These can be modified rather than hardcoding values for each dimension.
length = 1.0       # Length of the block
height = 1.0       # Height of the block
thickness = 1.0    # Thickness of the block

center_hole_dia = 0.5


args = sys.argv

if len(args) != 2:
    # print ""
    sys.exit("Usage: make.py input_file output_file")

# Create a 3D block based on the dimension variables above.
# 1.  Establishes a workplane that an object can be built on.
# 1a. Uses the X and Y origins to define the workplane, meaning that the
# positive Z direction is "up", and the negative Z direction is "down".
box = cq.Workplane("XY").transformed(offset=(0, 0.0, 0.5)) \
    .box(length, height, thickness) \
    .faces(">Z").workplane().hole(center_hole_dia)

# box2 = cq.Workplane("XY").transformed(offset=(0, 0.0, 1.0), rotate=(60, 60, 0)) \
box2 = cq.Workplane("XY").transformed(offset=(0, 0.0, 1.0)) \
    .sphere(0.3)

mat1 = (1.0, 0.0, 0.0, 1.0)
mat2 = (0.0, 1.0, 0.0, 0.5)

# filepath = "./simplest_manual.wrl"
filepath = args[1]

generator.export(filepath, [\
    (box, mat1), \
    (box2, mat2)
])

# TODO: Colors
# https://github.com/easyw/kicad-3d-models-in-freecad/blob/d1ec1e7d1484945cb9576cd381d080fd8beffca8/cadquery/FCAD_script_generator/_tools/shaderColors.py

# result.val().exportStl("./simplest.stl")

# The following method is now outdated, but can still be used to display the
# results of the script if you want
# from Helpers import show
# show(result)  # Render the result of this script

# show_object(result)
