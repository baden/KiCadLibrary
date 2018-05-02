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
mat1 = (0.2, 0.2, 0.2, 1.0)
box = cq.Workplane("XY").workplane(offset=pin_thickness) \
    .box(A, B, C-pin_thickness, centered=(True, True, False))



# Pins
mat2 = (1.0, 0.83, 0.0, 1.0)    # Gold
vp_l = 0.65
hp_l = 0.4
p_w = 0.25

ws = cq.Workplane("XY")

def rpin(l, w, rot, trans):
    return ws \
        .moveTo(-l/2, -w/2) \
        .lineTo(l/2 - w/2, -w/2) \
        .threePointArc((l/2, 0), (l/2 - w/2, w/2)) \
        .lineTo(-l/2, w/2) \
        .close() \
        .extrude(0.2, False) \
        .rotate((0,0,0), (0,0,1), rot) \
        .translate(trans)

pins = ws

for i in range(-5, 6):
    pins = pins.union(rpin(vp_l, p_w,   0, (-(A-vp_l)/2 - 0.01, i*0.5)))
    pins = pins.union(rpin(vp_l, p_w, 180, ( (A-vp_l)/2 + 0.01, i*0.5)))
#     pins = pins.union(pin.rotate((0,0,0), (0,0,1),   0).translate((-(A-p_l)/2, i*0.5,0)))
#     pins = pins.union(pin.rotate((0,0,0), (0,0,1), 180).translate(( (A-p_l)/2, i*0.5,0)))
#
for i in range(-1, 3):
    pins = pins.union(rpin(hp_l, p_w,  90, (i*0.5-0.25, (-(B-hp_l)/2 - 0.01))))
    pins = pins.union(rpin(hp_l, p_w, 270, (i*0.5-0.25, ( (B-hp_l)/2 + 0.01))))
#     pins = pins.union(pin.rotate((0,0,0), (0,0,1),  90).translate((i*0.5-0.25, (-(B-p_l)/2))))
#     pins = pins.union(pin.rotate((0,0,0), (0,0,1), 270).translate((i*0.5-0.25, ( (B-p_l)/2))))

e_w = 1.8
e_h = 4.5
e_c = 0.4

pins = pins.union(
    ws.moveTo(-e_w/2 + e_c, e_h/2) \
        .hLine(e_w - e_c).vLine(-e_h).hLine(-e_w).vLine(e_h - e_c).close() \
        .extrude(pin_thickness, False)
)

# Cut pins from body
# box = box.cut(pins)

# pins = cq.Workplane("XY") \
#     .moveTo(-(A-p_l)/2, 0).rarray(A-p_l, pitch, 2, 11, True).rect(p_l, p_w) \
#     .moveTo(0, -(B-p_l)/2).rarray(pitch, B-p_l, 4, 2, True).rect(p_w, p_l) \



# Label
mat3 = (1.0, 1.0, 1.0, 1.0)
label_v, label_f = generator.importStl("label.stl")


generator.export([
    (box, mat1),
    (pins, mat2),
    ([label_v, label_f], mat3),
])

# print "TBD!", v, f
