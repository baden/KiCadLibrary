#!/bin/bash

inkscape -E cover-shape1.ps cover-shape1.svg
pstoedit -dt -f dxf:-polyaslines\ -mm cover-shape1.ps cover-shape1.dxf
