# coding: utf-8
import os
import sys
import __builtin__
from stl import stl
import numpy as np
from math import pi as PI

def w_appearance(f, obj):
    shape_col = obj[:-1] #remove last item
    shape_transp = obj[-1]
    # print shape_col
    # print shape_transp
    f.write("      appearance Appearance {\n")
    f.write("        material Material {\n")
    f.write("          diffuseColor %g %g %g\n" % shape_col)
    # f.write("          specularColor 0.7 0.7 1.0\n")
    if shape_transp < 1.0:
        f.write("          transparency %g\n" % shape_transp)
    f.write("        }\n")
    f.write("      }\n")

def w_coord(f, v):
    f.write("        coord Coordinate {\n")
    # f.write("          point [\n            ")
    # f.write(',\n            '.join('%.4g %.4g %.4g' % tuple(p) for p in v))
    # f.write("\n          ]\n")
    f.write("          point [")
    f.write(', '.join('%.4g %.4g %.4g' % tuple(p) for p in v))
    f.write("]\n")
    f.write("        }\n")

def w_coordIndex(f, i):
    # f.write("        coordIndex [\n            ")
    # f.write(',\n            '.join("%d, %d, %d, -1" % tuple(f) for f in i))
    # f.write("\n        ]\n")
    f.write("        coordIndex [")
    f.write(', '.join("%d, %d, %d, -1" % tuple(f) for f in i))
    f.write("]\n")

def w_geometry(f, v, i):
    f.write("      geometry IndexedFaceSet {\n")
    f.write("        solid FALSE\n")
    w_coord(f, v)
    w_coordIndex(f, i)
    f.write("      }\n")

def w_shape(f, obj):
    f.write("    Shape {\n")
    w_appearance(f, obj[1])
    if hasattr(obj[0], "val"):
        # tes = obj[0].val().scale(1/2.54).tessellate(0.1)
        tes = obj[0].val().tessellate(0.1)
        v = [(p.x, p.y, p.z) for p in tes[0]]
        i = tes[1]
        w_geometry(f, v, i)
    else:
        w_geometry(f, obj[0][0].tolist(), obj[0][1])
    f.write("    }\n")

def w_def(f, name, obj):
    f.write("    DEF %s Shape {\n" % name)
    w_appearance(f, obj[1])
    if hasattr(obj[0], "val"):
        # tes = obj[0].val().scale(1/2.54).tessellate(0.1)
        tes = obj[0].val().tessellate(0.1)
        v = [(p.x, p.y, p.z) for p in tes[0]]
        i = tes[1]
        w_geometry(f, v, i)
    else:
        w_geometry(f, obj[0][0].tolist(), obj[0][1])
    f.write("    }\n")

def w_use(f, name, translate, rotate):
    f.write("    Transform {\n")
    f.write("      rotation 0 0 0  %g\n" % (rotate * PI / 180.0))
    # f.write("      translation %.4g %.4g %.4g\n" % tuple(t / 2.54 for t in translate))
    f.write("      translation %.3g %.3g %.3g\n" % translate)
    f.write("      children USE %s\n" % name)
    f.write("    }\n")

def w_children(f, parts, defs):
    f.write("  children [\n")
    for p in parts:
        w_use(f, p[0], p[1], p[2])
    f.write("  ]\n")

def w_swith(f, defs):
    f.write("Switch {\n")
    f.write("  choice [\n")
    for k, v in defs.iteritems():
        w_def(f, k, v)
    f.write("  ]\n")
    f.write("}\n")

def w_group(f, parts, defs):
    f.write("Transform {\n  scale 0.3937 0.3937 0.3937\n")
    w_children(f, parts, defs)
    f.write("}\n")

def export(objs):
    args = sys.argv
    filepath = args[1]
    print "Write WRML to %s (TBD)" % filepath
    with __builtin__.open(filepath, 'wb') as f:
        # #VRML V2.0 utf8
        # f.write("#VRML V2.0 utf8\n#manual exported\n\n")
        f.write("#VRML V2.0 utf8\n")
        w_group(f, objs)

def importStl(filename):
    part_path = sys.argv[2]
    mesh = stl.StlMesh(os.path.join(part_path, filename))

    faces = []
    vertices = []

    vertices = mesh.points.reshape(-1, 3)
    points, uidx = np.unique(vertices, axis=0, return_inverse=True)
    faces = uidx.reshape(-1, 3)

    return points, faces

# TODO: Возможно имеет смысл реализовать более полную иерархию
# https://castle-engine.io/vrml_engine_doc/output/xsl/html/section.def_use.html

class Assemble():
    def __init__(self):
        self.defs = {}
        self.parts = []

    def addDef(self, name, mesh, material):
        self.defs[name] = (mesh, material)

    def addUse(self, name, translate=(0,0,0), rotate=0):
        children = (name, translate, rotate)
        self.parts.append(children)

    def addPart(self, name, mesh, material, translate=(0,0,0), rotate=0):
        self.addDef(name, mesh, material)
        self.addUse(name, translate, rotate)
        # part = (mesh, material, material, rotate)
        # self.parts.append(part)

    def export(self):
        args = sys.argv
        filepath = args[1]
        print "Write WRML to %s (TBD)" % filepath

        with __builtin__.open(filepath, 'wb') as f:
            # #VRML V2.0 utf8
            # f.write("#VRML V2.0 utf8\n#manual exported\n\n")
            f.write("#VRML V2.0 utf8\n")
            w_swith(f, self.defs)
            w_group(f, self.parts, self.defs)
        # print self.parts
