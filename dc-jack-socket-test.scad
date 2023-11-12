include <enclosure/dc-jack-socket.scad>

difference() {

  translate([-10, 0, 0])
    cube([20, 20, 14]);

  translate([-9, 1, 11.9])
    cube([18, 18, 11]);

  translate([0, 1, 1])
    dcJackSocket();
}

//     dcJackSocket();
