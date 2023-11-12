include <enclosure/components.scad>
include <enclosure/sliders.scad>
include <enclosure/hd44780-lcd.scad>

$fn = 100;

module wall(length, angle) {
    x = length * sin(angle);
    y = length * cos(angle);

    rotate([0, -90])
        linear_extrude(1)
            polygon([
                [0, length/sin(90-angle)],
                [x, y],
                [0, 0]
            ]);
}

module controlPanel(width, height) {
    angle = 30;
    cutoffLength = 5 * tan(angle);
    footLength = 5 / sin(90-angle);
    sliderLength =  (height - footLength) * sin(angle);

    translate([0, 0, -1])
        difference() {
            union() {
                cube([width, height, 1]);
                difference() {
                    translate([0, 0, 1])
                        rotate([-angle, 0, 0])
                            translate([0, -5, -10])
                                cube([width, 8, 10]);

                    translate([-1, -10, -10])
                        cube([width + 2, 30, 10]);
                    }

                translate([5, 0 , 1])
                    rotate([-angle,0,0])
                        slider(true, sliderLength + cutoffLength, angle, 0);

                translate([width-5, 0, 1])
                    rotate([-angle,0,0])
                        slider(true, sliderLength + cutoffLength, angle, 0);

                translate([width, footLength, 1])
                    wall(sliderLength, 90-angle);

                translate([1, footLength, 1])
                    wall(sliderLength, 90-angle);
            }
        }
}

module modulePlate(width, depth, marginX = 0.2, marginY = 0.2) {

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


module controlPanelWithLcd(width, height) {
    lcdX = 110;
    lcdY = 55;

    translate([lcdX, lcdY, -1])
        hd44780Lcd();

    if ($componentMode == 0) {
        difference() {

            union() {
                controlPanel(width, height);

                translate([0, height-6])
                    cube([width,2,2]);

                translate([0, height-45])
                    cube([width,3,3]);
            }

            for (i = [0: 3]) {
                translate([lcdX + 30 - i * 20, 25])
                    cylinder(5, 3.6, 3.6, center=true);
            }

            translate([40, 55])
                cylinder(5, 3.8, 3.8, center=true);

            translate([20, 20])
                cylinder(5, 3.2, 3.2, center=true);

        }
    }
}

drawComponents() {
    controlPanelWithLcd(200, 80);
}

