// Configuration Parameters
include_lower_baseplate = false; // Set to false to remove the lower portion of the baseplate
include_press_fit_feet  = true;  // Set to false to remove the autoclave-safe press-fit silicone feet holes

// Frog Feet Parameters (for outer magnets and stability)
frog_foot_radius = 10; // Radius of the protruding feet lobes
foot_x_left  = -6;     // X coordinate of left feet centers
foot_x_right = 62;     // X coordinate of right feet centers
foot_y_front = 12;     // Y coordinate of front feet centers
foot_y_rear  = 84;     // Y coordinate of rear feet centers

// Silicone Rubber Feet Parameters (optimized for maximum stability, avoiding magnet slots)
silicone_foot_x_left  = 6;
silicone_foot_x_right = 50;
silicone_foot_y_front = 14.2;
silicone_foot_y_rear  = 79.2;

// Hexagonal Tool Slot Parameters
hex_slot_width  = 10; // Width across flats
hex_slot_length = 30; // Cylinder height
hex_slot_radius = hex_slot_width / (2 * cos(30)); // Derived radius from width (cos(30°) = sqrt(3)/2)

// Base Plate
$fn = 50; // Smoothness setting

difference() {
    // Round the main block structure only (including the 4 frog feet lobes)
    minkowski() {
        translate([0,0,-0.8])
        union() {
            cube([56, 96, 5]);
            // 4 protruding frog feet lobes (radius offset by -0.5 to account for minkowski sphere)
            for (pos = [[foot_x_left, foot_y_front], [foot_x_right, foot_y_front], [foot_x_left, foot_y_rear], [foot_x_right, foot_y_rear]]) {
                translate([pos[0], pos[1], 0])
                cylinder(h=5, r=frog_foot_radius - 0.5, $fn=50);
            }
        }
        sphere(r=0.5, $fn=30); // Radius for rounding
    }
    
    // Magnet cutout #1 (centered on front-left frog foot)
    translate([foot_x_left, foot_y_front, 0])
    #cylinder(h=2.8, d=13.4);
    translate([foot_x_left - frog_foot_radius - 2, foot_y_front - 13.4/2, 0])
    #cube([frog_foot_radius + 2, 13.4, 2.8]); // Entry slot from left edge
    
    // Magnet cutout #2 (centered on rear-left frog foot)
    translate([foot_x_left, foot_y_rear, 0])
    #cylinder(h=2.8, d=13.4);
    translate([foot_x_left - frog_foot_radius - 2, foot_y_rear - 13.4/2, 0])
    #cube([frog_foot_radius + 2, 13.4, 2.8]); // Entry slot from left edge
    
    // Magnet cutout #3 (centered on front-right frog foot)
    translate([foot_x_right, foot_y_front, 0])
    #cylinder(h=2.8, d=13.4);
    translate([foot_x_right, foot_y_front - 13.4/2, 0])
    #cube([frog_foot_radius + 2, 13.4, 2.8]); // Entry slot from right edge
    
    // Magnet cutout #4 (centered on rear-right frog foot)
    translate([foot_x_right, foot_y_rear, 0])
    #cylinder(h=2.8, d=13.4);
    translate([foot_x_right, foot_y_rear - 13.4/2, 0])
    #cube([frog_foot_radius + 2, 13.4, 2.8]); // Entry slot from right edge
    
    // Autoclave-safe press-fit silicone feet stepped through-holes
    // Positioned as far outward as possible to maximize stability, while avoiding magnet slots.
    // Each foot is a union of three concentric cylinders creating a mechanical lock.
    if (include_press_fit_feet) {
        for (pos = [[silicone_foot_x_left, silicone_foot_y_front], [silicone_foot_x_right, silicone_foot_y_front], [silicone_foot_x_left, silicone_foot_y_rear], [silicone_foot_x_right, silicone_foot_y_rear]]) {
            translate([pos[0], pos[1], 0]) {
                // 1. Bottom recess (diameter 8.5mm, Z from -1.4 to 0.2)
                translate([0, 0, -1.4]) cylinder(h=1.6, d=8.5, $fn=50);
                
                // 2. Retaining throat through-hole (diameter 4.0mm, Z from 0.2 to 3.2)
                translate([0, 0, 0.2]) cylinder(h=3.0, d=4.0, $fn=50);
                
                // 3. Top locking counterbore (diameter 6.5mm, Z from 3.2 to 4.8)
                translate([0, 0, 3.2]) cylinder(h=1.6, d=6.5, $fn=50);
            }
        }
    }
}

// Motor Riser
difference() {
    // Round the main block structure only
    minkowski() {
        // Riser
        rotate([-5,0,0])
            translate([0,0,2])
                cube([56, 6, 36]); // Original 60x7x40 reduced by 4mm
        sphere(r=0.5, $fn=30);
    }
    
    // large cutout
    rotate([90,0,0])
        translate([28,50,-20])
            cylinder(h=40, r=25, $fn=100);     
            
    // Small cutout   
    rotate([90,0,0])
        translate([28,30,-20])
            cylinder(h=40, r=13, $fn=100);
            
    // Hexagonal tool slots (using global parameters)
    rotate([90,0,0])
        translate([6,10,0])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
      
    rotate([90,0,0])
        translate([20,10,0])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
   
    rotate([90,0,0])
        translate([34,10,0])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
      
    rotate([90,0,0])
        translate([50,10,0])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
}

// Handpiece Riser
difference() {
    // Round the main block structure only
    minkowski() {
        translate([0,98,0])
            rotate([5,0,0])
                translate([0,-9.9,2])
                    cube([56, 8, 36]); // Original 60x7x40 reduced by 4mm
        sphere(r=0.5, $fn=30);
    }
    
    // large cutout
    rotate([90,0,0])
        translate([28,50,-120])
            cylinder(h=40, r=25, $fn=100);     
            
    // Small cutout   
    rotate([90,0,0])
        translate([28,30,-120])
            cylinder(h=40, r=10, $fn=100);
            
    // Magnet cutout
    rotate([0,0,0])
        translate([28,90,8])
            cylinder(h=11, r=5.8, $fn=100);

        
    // Hexagonal tool slots (using global parameters)
    rotate([90,0,0])
        translate([6,10,-90])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
      
    rotate([90,0,0])
        translate([6,25,-90])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
   
    rotate([90,0,0])
        translate([50,25,-90])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
      
    rotate([90,0,0])
        translate([50,10,-90])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
      
    rotate([90,0,0])
        translate([15,18,-90])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
      
    rotate([90,0,0])
        translate([40,18,-90])  
            cylinder(h = hex_slot_length, r = hex_slot_radius, $fn = 6, center = true);
}  

if (include_lower_baseplate) {
    translate([0, 0, -4])
    union() {
        cube([56, 96, 3]);
        for (pos = [[foot_x_left, foot_y_front], [foot_x_right, foot_y_front], [foot_x_left, foot_y_rear], [foot_x_right, foot_y_rear]]) {
            translate([pos[0], pos[1], 0])
            cylinder(h=3, r=frog_foot_radius, $fn=50);
        }
    }
}
