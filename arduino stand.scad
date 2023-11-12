include <enclosure/sliders.scad>
include <enclosure/arduino-uno.scad>
include <base-module.scad>
include <control-panel-module.scad>
include <module-plate.scad>


translate([-85, 10, 3]) {

    // -------------------------------------------------------------------------
    // translate([0, 0])
    //    color("blue")
    //         modulePlate(170, 30, 0.6);

    // -------------------------------------------------------------------------

    //  translate([0, 35])
    //     color("blue")
    //         modulePlate(170, 60, 0.6); 

    // -------------------------------------------------------------------------
    /* translate([-10, 100]) {
        color("yellow")
            modulePlate(110, 60);

        translate([0, 3, 1])
            rotate([0, 0, 0])
                arduinoMega();
    }
    translate([105, 100])
        color("blue")
            modulePlate(60, 60); */


    // -------------------------------------------------------------------------
    translate([-10, 200]) {
        color("yellow")
            modulePlate(70, 60);
    
        translate([0, 3, 1])
            rotate([0, 0, 0])
                arduinoUno();
    }
    
    // translate([65, 200])
    //     color("blue")
    //         modulePlate(100, 60);


    // -------------------------------------------------------------------------
    // translate([65, 120]) {
    //   color("blue")
    //       modulePlate(70, 60);
    //
    //   translate([9, 49, 0])
    //     rotate([0, 0, -90])
    //       rfIdRc522();
    // }


    // translate([0, 30]) {
    //   color("yellow")
    //       modulePlate(120, 60);
    //
    //   translate([10, 3, 1])
    //       rotate([0, 0, 0])
    //           arduinoMega();
    // }


    // -------------------------------------------------------------------------
    // translate([0, 30]) {
    //   color("yellow")
    //       modulePlate(50, 60);
    
    //   translate([40, 45, 1])
    //       rotate([0, 0, 180])
    //         tea5767FmRadio();
    
    //   translate([33, 52, 2.1])
    //     rotate([0, 0, 90])
    //       scale([0.1, 0.1, 0.02])
    //         surface(file = "speaker.png", center=true, convexity=5, invert=true);
    // }


}



translate([0, 0, 5.1])
    rotate([120,0,180])
        translate([-95,0])
        color("green")
            controlPanelWithLcd(190, 80);

controlPanel(190, 80);
