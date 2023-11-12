use <enclosure/d1-mini-node-mcu.scad>
use <enclosure/dc-jack-socket.scad>
use <enclosure/pilars.scad>
use <enclosure/antenna443Mhz.scad>
use <enclosure/superheterodyne-433-receiver.scad>
use <enclosure/superheterodyne-433-transmitter.scad>

translate([0, 0, 0]) {

  difference() {
    union() {
      translate([35, 40, 10])
        difference() {
          cube([70, 80, 20], true);

          translate([0, 0, 1])
            cube([68, 78, 20], true);
        }

      translate([1, 1, 1])
        d1MiniNodeMcu();

      translate([59, 1, 1])
        cube([10, 17, 10.99]);

      translate([1, 52, 1]) {

        %color("green", 0.5)
          translate([0, 0, 4])
            cube([42, 24, 1.6]);

        translate([2, 2, 0])
          pilarWithPin(4, 4, 4, 2);

        translate([2, 22, 0])
          pilarWithPin(4, 4, 4, 2);

        translate([40, 2, 0])
          pilarWithPin(4, 4, 4, 2);

        translate([40, 22, 0])
          pilarWithPin(4, 4, 4, 2);

      }
    }

    translate([1, 1, 1])
      d1MiniNodeMcu();

    translate([60, 1, 1])
      dcJackSocket();

    translate([-10, 57, 6.5])
      cube([20, 15, 2.5]);

    translate([47, 35, 4])
      rotate([0, 0, -90])
        superheterodyne433Receiver();

    translate([35, 40, 2])
      antenna443Mhz();

    translate([45, 55, 4])
      rotate([0, 0, 0])
        superheterodyne433Transmitter();

    translate([62, 50, 2])
      antenna443Mhz();
  }
}
