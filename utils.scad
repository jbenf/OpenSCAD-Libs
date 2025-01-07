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