import sys
import os
# sys.path.append("../../tools")
sys.path.append("tools")
import generator
import cadquery as cq


assemble = generator.Assemble()

A = 4.0
B = 6.0
C = 0.8
pitch = 0.5
pin_thickness = 0.08

# Body.
mat1 = (0.2, 0.2, 0.2, 1.0)
box = cq.Workplane("XY").workplane(offset=pin_thickness) \
    .box(A, B, C-pin_thickness, centered=(True, True, False))

assemble.addPart("body", box, mat1)

# Pins
mat2 = (1.0, 0.83, 0.0, 1.0)    # Gold
vp_l = 0.65
hp_l = 0.4
p_w = 0.25

ws = cq.Workplane("XY")

def rpin(l, w):
    return ws \
        .moveTo(-l/2, -w/2) \
        .lineTo(l/2 - w/2, -w/2) \
        .threePointArc((l/2, 0), (l/2 - w/2, w/2)) \
        .lineTo(-l/2, w/2) \
        .close() \
        .extrude(0.2, False)

pin1 = rpin(vp_l, p_w)
assemble.addDef("vpin", pin1, mat2)

pin2 = rpin(hp_l, p_w)
assemble.addDef("hpin", pin2, mat2)

for i in range(-5, 6):
    assemble.addUse("vpin", translate = (-(A-vp_l)/2 - 0.01, i*0.5, 0), rotate =   0)
    assemble.addUse("vpin", translate = ( (A-vp_l)/2 + 0.01, i*0.5, 0), rotate = 180)

for i in range(-1, 3):
    assemble.addUse("hpin", translate = (i*0.5-0.25, (-(B-hp_l)/2 - 0.01), 0), rotate =  90)
    assemble.addUse("hpin", translate = (i*0.5-0.25, ( (B-hp_l)/2 + 0.01), 0), rotate = 270)

e_w = 1.8
e_h = 4.5
e_c = 0.4

grnd_pin = ws.moveTo(-e_w/2 + e_c, e_h/2) \
        .hLine(e_w - e_c).vLine(-e_h).hLine(-e_w).vLine(e_h - e_c).close() \
        .extrude(pin_thickness, False)

assemble.addPart("ground", grnd_pin, mat2)

# Label
mat3 = (1.0, 1.0, 1.0, 1.0)
label_v, label_f = generator.importStl("label.stl")

assemble.addPart("label", [label_v, label_f], mat3)

assemble.export()
