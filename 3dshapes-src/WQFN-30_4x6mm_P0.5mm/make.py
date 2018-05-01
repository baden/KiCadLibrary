import sys
import os
# sys.path.append("../../tools")
sys.path.append("tools")
import generator
import cadquery as cq

A = 4.0
B = 6.0
C = 0.8
pitch = 0.5
pin_thickness = 0.08

# Body.
mat1 = (0.2, 0.2, 0.2, 0.1)
box = cq.Workplane("XY").workplane(offset=pin_thickness) \
    .box(A, B, C-pin_thickness, centered=(True, True, False))


# Pins
mat2 = (1.0, 0.83, 0.0, 1.0)    # Gold
p_l = 0.65
p_w = 0.25
pins = cq.Workplane("XY") \
    .moveTo(-(A-p_l)/2, 0).rarray(A-p_l, pitch, 2, 11, True).rect(p_l, p_w) \
    .moveTo(0, -(B-p_l)/2).rarray(pitch, B-p_l, 4, 2, True).rect(p_w, p_l) \
    .extrude(pin_thickness, False)


# Label
mat3 = (1.0, 1.0, 1.0, 1.0)
label_v, label_f = generator.importStl("label.stl")


generator.export([
    (box, mat1),
    (pins, mat2),
    ([label_v, label_f], mat3),
])

# print "TBD!", v, f
