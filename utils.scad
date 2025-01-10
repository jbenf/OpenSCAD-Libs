/**
  2d Module which creates a circle arc segment defined by the diameter and two angles.
 
  arguments:
   - d: diameter
   - a1: angle1
   - a2: angle2
 */
module circle_arc(d = 20, a1 = 0, a2 = 360) {
    r = d / 2;
    difference() {
        circle(d = d);
        if (a1 % 360 != a2 % 360) {
            angles=[ for ( a = [a1:45:a2-10]) a, a2 ];
            echo (angles);
            coords=[ [0,0], for (th=angles) [d*cos(th), d*sin(th)] ];
            polygon(coords);
        }
    }
}

/**
  A completely inefficent but convinient way to alter imported stl files. It allows to remove, scale
  and multiply segments along the X-axis of an object.
  
  arguments: 
    - x1: X coordinate of the start of the segment
    - x2: X coordinate of the end of the segment
    - n: number of segments
    - scale: scale of the segment
*/
module slice(x1=0,x2=10,n=1,scale=1.0){
    w = x2 - x1;
    intersection() {
        children();
        translate([-500+x1,0,0]) cube([1000,1000,1000], center=true);
    }
    translate([-w + n*w*scale,0,0])
    intersection() {
        children();
        translate([500+x2,0,0]) cube([1000,1000,1000], center=true);
    }
    
    if(n > 0) {
        for(i=[0:n-1]) {
            translate([x1 + i*w*scale,0,0])
            scale([scale, 1.0, 1.0]) translate([-x1,0,0]) intersection() {
                children();
                translate([w/2+x1,0,0]) cube([w,1000,1000], center=true);
            }
        }
    }
}

/**
  arguments:
    - size: cube size as array
    - center: center the cube
    - centerXY: center the cube in the XY plane
    - r: corner radius
    - flat: only round sides, top and bottom flat
 */
module rounded_cube(size, center=false, centerXY=false, r=3, flat=false) {
    centerXY = center ? true : centerXY;
    if(flat) {
        hull() {
            for ( x = [0 : 1] ){
                for ( y = [0 : 1] ){
                    translate([
                        r+x*(size[0]-2*r)-(centerXY ? size[0]/2 : 0),
                        r+y*(size[1]-2*r)-(centerXY ? size[1]/2 : 0),
                        -(center ? size[2]/2 : 0)]) cylinder(h = size[2], r=r);
                }
            }
        }
    } else {
        hull() {
            for ( x = [0 : 1] ){
                for ( y = [0 : 1] ){
                    for ( z = [0 : 1] ){
                        translate([
                            r+x*(size[0]-2*r)-(centerXY ? size[0]/2 : 0),
                            r+y*(size[1]-2*r)-(centerXY ? size[1]/2 : 0),
                            r+z*(size[2]-2*r)-(center ? size[2]/2 : 0)]) sphere(r=r);
                    }
                }
            }
        }
    }
}


module hsw_peg(h=10, d1=15.4, d2=14.9) {
    difference() {
        hull() {
            cylinder(d=d1, h=h/2, $fn=6);
            translate([0,sin(60)*(d1-d2)/2,0]) cylinder(d=d2, h=h, $fn=6);
        }
        cylinder(d=3.7, h=2*h-2, center=true, $fn=60);
    }
}