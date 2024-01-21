include <components/components.scad>
include <enclosure/lcd-screen-x240x240.scad>
include <enclosure/lcd-screen-x160x80.scad>
include <enclosure/ESP-prog.scad>
include <enclosure/rotary-encoder.scad>
include <enclosure/hd44780-lcd.scad>
include <enclosure/arduino-uno.scad>
include <enclosure/dc-jack-socket.scad>
include <enclosure/circuit-board-7x5.scad>
include <enclosure/rfid-rc522.scad>
include <enclosure/battery-holder.scad>
include <enclosure/arduino-mega.scad>
include <enclosure/samd21-M0-mini.scad>
include <enclosure/antenna.scad>
include <enclosure/d1-mini-node-mcu.scad>
include <enclosure/led-matrix.scad>
include <enclosure/esp8285m2.scad>
include <enclosure/servo.scad>
include <enclosure/datalogger.scad>
include <enclosure/lora.scad>
include <enclosure/stepper.scad>
include <enclosure/joystick.scad>
include <enclosure/speaker.scad>
include <enclosure/led-strip-driver.scad>
include <enclosure/isd1820.scad>
include <enclosure/hc-sr501.scad>
include <enclosure/relay.scad>
include <enclosure/cr2032.scad>

$fn = 100;


module corner() {
    if ($componentMode == componentTarget_mass) {

        union() {

            minkowski() {
                cylinder(3, 3, 3);

                translate([0, -5, 0])
                    cube([0.001, 5, 0.001]);
            } 

            minkowski() {
                cylinder(3, 3, 3);

                translate([-5, 0, 0])
                    cube([5, 0.001, 0.001]);
            } 
        }
    } else if ($componentMode == componentTarget_hole) {
        translate([-11, -11, 1.5])
            cube([10, 10, 3]);

        translate([-5, -16, 1.5])
            cube([10, 10, 3]);

        translate([-16, -5, 1.5])
            cube([10, 10, 3]);

        // translate([-7, -1, 0])
        //     cube([7, 1, 3]);

        translate([0, 0, -1])
            cylinder(10, 1.7, 1.7);
    }

}


module plate(x, y) {

    margin = 0.2;

    translate([0, 0, -1.5])
    if ($componentMode == componentTarget_mass) {
        difference() {
            union() {
                translate([8, margin, 0]) 
                    cube([
                        x * 10 - 16, 
                        y * 10 - 2 * margin, 
                        1.5]);

                translate([margin, 8, 0]) 
                    cube([
                        x * 10 - 2 * margin, 
                        y * 10 - 16, 
                        1.5]);

                translate([1 + margin, 1 + margin, 0]) 
                    cube([
                        x * 10 - 2 - 2 * margin,
                        y * 10 - 2 - 2 * margin, 
                        1.5]);
            }

            for (a = [2: 1 : x-2]) {
                translate([a * 10, 0, -1])
                    cylinder(3, 1.5, 1.5);

                translate([a * 10, y * 10, -1])
                    cylinder(3, 1.5, 1.5);
            }

            for (b = [2: 1 : y-2]) {
                translate([0, b * 10, -1])
                    cylinder(3, 1.5, 1.5);

                translate([x * 10, b * 10, -1])
                    cylinder(3, 1.5, 1.5);
            }
        }
    }

}

*hold();

*rotate([0, 0, 90]) 
    hold();

*rotate([0, 0, 180]) 
    hold();

*rotate([0, 0, 270]) 
    hold();


*drawComponents() {
    plate(6, 4);

    translate([10, 4, 0]) 
        screenMount240x240();
}


*drawComponents() {
    plate(9, 5);

    translate([45, 25, 0]) 
        espProg();
}


*drawComponents() {
    plate(4, 3);

    translate([7, 5, 0]) 
        rotaryEncoder1();
}

*drawComponents() {
    corner();

    *rotate([0, 0, 90]) 
        corner();

    // if ($componentMode == componentTarget_hole) {
    //     translate([-10, 0, 1.5])
    //         cube([20, 20, 2]);
    // }

    // if ($componentMode == componentTarget_hole) {
    //     translate([0, -10, 1.5])
    //         cube([20, 20, 2]);
    // }

    *rotate([0, 0, 180]) 
        corner();

    *rotate([0, 0, 270]) 
         corner();
}


*drawComponents() {
    plate(11, 18);
}

*drawComponents() {
    plate(10, 7);
}


*drawComponents() {
    plate(10, 5);

    translate([13, 10, 0])
        hd44780Lcd_pilars();
}


*drawComponents() {
    plate(9, 6);

    translate([10, 3.5, 0])
        arduinoUno();
}

*drawComponents() {
    plate(3, 3);

    translate([9.5, 5, 0])
        dcJackSocket();
}

*drawComponents() {
    plate(8, 6);

    translate([3, 3, 0])
        circuitBoard7x5();
}

*drawComponents() {
    plate(5, 7);

    translate([5, 5, 0])
        rfIdRc522();
}

*drawComponents() {
    plate(4, 12);

    translate([5, 5, 0])
        batteryHolder1();
}

*drawComponents() {
    plate(12, 6);

    translate([10, 3.5, 0])
        arduinoMega();
}

*drawComponents() {
    plate(3, 7);

    translate([5, 8, 0])
        samd21M0Mini();
}

*drawComponents() {
    plate(3, 6);

    translate([3, 42, 0])
        antenna();
}

*drawComponents() {
    plate(5, 5);

    translate([10, 5, 0])
        d1MiniNodeMcu();
    
    d1MiniNodeMcuFixate([-15, 0, -1.5]);

    d1MiniNodeMcuButton([-15, 25, -1.5], 7);

}


*drawComponents() {
    plate(4, 4);

    translate([4, 4, 0])
        ledMatrix();
}

*drawComponents() {
    plate(5, 5);

    translate([5, 5, 0])
        esp8285m2();
}

*drawComponents() {
    plate(7, 10);
}

*drawComponents() {
    plate(7, 18);
}

*drawComponents() {
    plate(11, 10);
}


*drawComponents() {
    plate(4, 4);

    translate([6, 4, 0])
        bms360max();

    translate([18, 4, 0])
        bms360max();
}

*drawComponents() {
    plate(5, 5);

    translate([7, 9, 0])
        dataLogger();
}


*drawComponents() {
    plate(4, 6);

    translate([5, 4, 0])
        lora();
}


*drawComponents() {
    plate(5, 5);

    translate([10, 10, 0])
        rotate([0, 0, 45])
            stepper36BYG();
}


*drawComponents() {
    plate(4, 4);

    translate([7, 5, 0]) 
        screenMount160x80();
}


*drawComponents() {
    plate(4, 5);

    translate([10.1, 8, 0]) 
        joystick();
}

*drawComponents() {
    translate([-25, -25, 0])
        plate(5, 5);

    translate([0, 0, 0]) 
        speaker1();
}

*drawComponents() {
    speaker1_seal();
}


*drawComponents() {
    plate(7, 7);

    translate([4, 6, 0])
        batteryHolder4AA();
}

*drawComponents() {
    plate(6, 7);

    translate([6.5, 6, 0])
        batteryHolder3AA();
}

*drawComponents() {
    plate(4, 7);

    translate([4, 6, 0])
        batteryHolder2AA();
}

*drawComponents() {
    plate(4, 6);

    translate([8, 9, 0])
        ledStripDriver();
}

*drawComponents() {
    plate(5, 5);

    translate([(50-39)/2, (50-43)/2, 0])
        isd1820();
}


*drawComponents() {
    plate(3, 4);

    translate([3, 4, 0])
        hcsr501();
}


*drawComponents() {
    // plate(3, 4);

    translate([3, 4, 0])
        relay1();
}


*drawComponents() {
    relay1_seal();
}


drawComponents() {
    cr2032_seal();
}
