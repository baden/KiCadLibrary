# coding: utf-8
import __builtin__

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

def w_coord(f, obj):
    f.write("        coord Coordinate {\n")
    f.write("          point [\n            ")
    f.write(',\n            '.join('%g %g %g' % (p.x, p.y, p.z) for p in obj[0]))
    f.write("\n          ]\n")
    f.write("        }\n")

def w_coordIndex(f, obj):
    f.write("        coordIndex [\n            ")
    f.write(',\n            '.join("%d, %d, %d, -1" % f for f in obj[1]))
    f.write("\n        ]\n")

def w_geometry(f, obj):
    f.write("      geometry IndexedFaceSet {\n")
    f.write("        solid FALSE\n")
    w_coord(f, obj)
    w_coordIndex(f, obj)
    f.write("      }\n")

def w_shape(f, obj):
    f.write("    Shape {\n")
    w_appearance(f, obj[1])
    tes = obj[0].val().tessellate(0.05)
    w_geometry(f, tes)
    f.write("    }\n")

def w_children(f, obj):
    f.write("  children [\n")
    for shape in obj:
        w_shape(f, shape)
    # TODO: Can contain several shapes
    # w_shape(f, obj)
    f.write("  ]\n")

def w_group(f, obj):
    f.write("Group {\n")
    w_children(f, obj)
    f.write("}\n")

def export(filepath, obj):
    with __builtin__.open(filepath, 'wb') as f:
        # #VRML V2.0 utf8
        # f.write("#VRML V2.0 utf8\n#manual exported\n\n")
        f.write("#VRML V2.0 utf8\n")
        w_group(f, obj)
