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