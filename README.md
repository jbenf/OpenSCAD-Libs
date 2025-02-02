# Collection of OpenSCAD Libraries

## Init

    git submodule update --init

## Usage

    use <utils.scad>

## Modules

###  circle_arc(d = 20, a1 = 0, a2 = 360)

2d Module which creates a circle arc segment defined by the diameter and two angles.

arguments:
  - d: diameter
  - a1: angle1
  - a2: angle2

### slice(x1=0,x2=10,n=1,scale=1.0)

A completely inefficent but convinient way to alter imported stl files. It allows to remove, scale
and multiply segments along the X-axis of an object.

arguments: 
  - x1: X coordinate of the start of the segment
  - x2: X coordinate of the end of the segment
  - n: number of segments
  - scale: scale of the segment

example:

    slice(21.5, 45, 10)
    rotate([0,90,0]) // Slice works along the x-axis, rotation might be needed
    import("./hexB_keyhole_5x3x90mm_2.5mm-wall_2mm-rim.stl");

### rounded_cube(size, center=false, centerXY=false, r=3, flat=false)

rounded cube

arguments:
  - size: cube size as array
  - center: center the cube
  - centerXY: center the cube in the XY plane
  - r: corner radius
  - flat: only round sides, top and bottom flat

### hsw_peg(h=10, d1=15.4, d2=14.9)

Peg for the Honeycomb Storage Wall. 