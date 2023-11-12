module modulePlate(width, depth, marginX = 0.2, , marginY = 0.2) {

    translate([width/2, depth/2, 1])
    difference() {
        union() {

            difference() {

                cube([width- 2 * marginX, depth- 2 * marginY,2],true);

                translate([0, 0, 1])
                    cube([width - 4 - 2 * marginX, depth - 4 - 2 * marginY,2],true);
            }

            for (x=[1: 1: depth / 10]) {
                translate([-width / 2 - 0.2 + marginX, x * 10 - depth / 2 - 5, 0])
                    cube([1.4, 2.4, 2], true);
            }

            for (x=[1: 1: width / 10]) {
                translate([ x * 10 - width / 2 - 5, -depth / 2 - 0.2 + marginY, 0])
                    cube([2.4, 1.4, 2], true);
            }
        }

        for (x=[1: 1: depth / 10]) {
            translate([width / 2 + 0.2 - marginX, x * 10 -depth / 2 - 5, 0])
                cube([2, 3, 3], true);
        }

        for (x=[1: 1: width / 10]) {
            translate([x * 10 - width / 2 - 5, depth / 2 + 0.2 - marginY, 0])
                cube([3, 2, 3], true);
        }
    }

}
