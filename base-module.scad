include <enclosure/sliders.scad>
use <control-panel-module.scad>

module basePlate(width,depth) {
    d = 10;

    translate([0, depth / 2, 2.5])
    union() {
        difference() {
            cube([width, depth, 5],true);
            cube([width - 2 * d, depth - 2 * d, 6],true);

            for (i=[0: 10: (depth - 2 * d - 5)]) {
                translate([-width / 2 + d, i - (depth - 2 * d ) / 2 + 5, 0])
                    cube([2, 3, 6], true);
            }

            for (i=[0: 10: (width - 2 * d - 5)]) {
                translate([i - (width - 2 * d) / 2 + 5, - depth / 2 + d, 0])
                    cube([3, 2, 6], true);
            }

        }

        for (i=[0: 10: (depth - 2 * d - 5)]) {
            translate([width / 2 - d, i - (depth - 2 * d ) / 2 + 5, 0])
                cube([1.6, 2.6, 5], true);
        }

        for (i=[0: 10: (width - 2 * d - 5)]) {
            translate([i - (width - 2 * d) / 2 + 5, depth / 2 - d, 0])
                cube([2.6, 1.6, 5], true);
        }

        l = sqrt(pow(width-2*d,2) + pow(depth-2*d,2));

        angle = atan((depth-2*d)/(width-2*d));

        translate([0,0,-1.5]) {
            difference() {
                cube([width, depth, 2],true);
                cube([width - 2 * d - 2, depth - 2 * d - 2, 3],true);
            }

            for (i=[0: 20: (depth - 2 * d) / 2 - 10]) {

                translate([0, -i, 0])
                    cube([width, 1, 2], true);

                translate([0, i , 0])
                    cube([width, 1, 2], true);
            }

            for (i=[0: 20: (width - 2 * d) / 2 - 10]) {

                translate([-i, 0, 0])
                    cube([1, depth, 2],true);

                translate([i, 0, 0])
                    cube([1, depth, 2],true);
            }

            rotate(-angle)
                cube([l,1,2],true);

            rotate(angle)
                cube([l,1,2],true);
        }
    }
}


module wall(length, angle) {
    x = length * sin(angle);
    y = length * cos(angle);

    rotate([0, -90])
        linear_extrude(1)
            polygon([
                [0, length/sin(90-angle)],
                [x, y],
                [0, 0]
            ], center=false);
}


module basePlateWithSliders(width, depth) {

    basePlate(width, depth);

    translate([width/2 - 5, 10, 5])
        rotate([90,0,180])
            color("red")
            slider(false, depth - 20, 30, 30);

    translate([-width/2 + 5, 10, 5])
        rotate([90,0,180])
            color("red")
            slider(false, depth - 20, 30, 30);


    translate([-width/2 + 10, depth - 5, 5])
        rotate([90,0,90])
            color("red")
            slider(false, width - 20, 30, 30);


    translate([-width/2 + 10,  5, 5])
        rotate([90,0,90])
            color("red")
            slider(false, width - 20, 30, 30);

}

basePlateWithSliders(190,170);

%translate([0, 0, 5.1])
    rotate([120,0,180])
        translate([-95,0])
            controlPanelWithLcd(190, 80);
