# coding: utf-8
import os
import sys
import __builtin__
from stl import stl
import numpy as np

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
    f.write("          point [\n            ")
    f.write(',\n            '.join('%g %g %g' % tuple(p) for p in v))
    f.write("\n          ]\n")
    f.write("        }\n")

def w_coordIndex(f, i):
    f.write("        coordIndex [\n            ")
    f.write(',\n            '.join("%d, %d, %d, -1" % tuple(f) for f in i))
    f.write("\n        ]\n")

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
        tes = obj[0].val().scale(1/2.54).tessellate(0.05)
        v = [(p.x, p.y, p.z) for p in tes[0]]
        i = tes[1]
        w_geometry(f, v, i)
    else:
        w_geometry(f, obj[0][0].tolist(), obj[0][1])
    f.write("    }\n")

def w_children(f, objs):
    f.write("  children [\n")
    for shape in objs:
        w_shape(f, shape)
    # TODO: Can contain several shapes
    # w_shape(f, obj)
    f.write("  ]\n")

def w_group(f, objs):
    f.write("Group {\n")
    w_children(f, objs)
    f.write("}\n")

def export(objs):
    args = sys.argv

    # if len(args) != 2:
    #     # print ""
    #     sys.exit("Usage: %s input_file output_file" % args[0])

    # filepath = "./simplest_manual.wrl"
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
