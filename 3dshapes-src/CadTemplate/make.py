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

# Create a 3D block based on the dimension variables above.
# 1.  Establishes a workplane that an object can be built on.
# 1a. Uses the X and Y origins to define the workplane, meaning that the
# positive Z direction is "up", and the negative Z direction is "down".
box = cq.Workplane("XY").workplane(offset=pin_thickness) \
    .box(length, height, thickness, centered=(True, True, False)) \
    .edges(">Z").chamfer(0.2)
    # .faces(">Z").workplane().hole(center_hole_dia)

# box2 = cq.Workplane("XY").transformed(offset=(0, 0.0, 1.0), rotate=(60, 60, 0)) \
box2 = cq.Workplane("XY").transformed(offset=(0, 0.0, 1.0)) \
    .sphere(0.3)

mat1 = (1.0, 0.0, 0.0, 1.0)
mat2 = (0.0, 1.0, 0.0, 0.5)

generator.export([
    (box, mat1),
    (box2, mat2)
])

# solids = []
# # solids.append(box.val())
# solids.append(box2.val())
# all = cq.Workplane("XY").newObject(solids)

all = box.cut(box2)
# all.exportSvg('aaaa.svg', view_vector=(0.612375, 0.612375, -0.5))
all.exportSvg('aaaa.svg', view_vector=(5, 5, 2))
# all.exportSvg('aaaa.svg')

# TODO: Colors
# https://github.com/easyw/kicad-3d-models-in-freecad/blob/d1ec1e7d1484945cb9576cd381d080fd8beffca8/cadquery/FCAD_script_generator/_tools/shaderColors.py

# result.val().exportStl("./simplest.stl")

# The following method is now outdated, but can still be used to display the
# results of the script if you want
# from Helpers import show
# show(result)  # Render the result of this script

# show_object(result)
