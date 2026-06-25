// Base Plate
$fn = 50; // Smoothness setting
minkowski() {
    difference() {
        translate([0,0,-0.8])
        cube([56, 96, 5]); // Reduced by 4mm (2*r) in each dimension
       // Metal Base Plate
       //translate([5,15,-1])
         //   cube([47,67,1.2]);
       // Magnet Slot #1
        //rotate([90,0,0])
          //  translate([6,10,0])  
            //  #cylinder(h =2 , r =6.5 , $fn = 30, center = true);
            
            // Magnet cutout #1 (centered on top surface)
    translate([8, 14.2, 0])  // Center XY, position at Z=3 (5mm height - 2mm depth)
    #cylinder(h=2.8, d=13.4);  // 2mm deep, 13mm diameter hole
    translate([0, 7.5, 0])
    #cube([9, 13.4, 2.8]);
    
    // Magnet cutout #2 (centered on top surface)
    translate([8, 14+65.2, 0])  // Center XY, position at Z=3 (5mm height - 2mm depth)
    #cylinder(h=2.8, d=13.4);  // 2mm deep, 13mm diameter hole
    translate([0, 7.5+65, 0])
    #cube([9, 13.4, 2.8]);
    
                // Magnet cutout #3 (centered on top surface)
    translate([6+42, 14.2, 0])  // Center XY, position at Z=3 (5mm height - 2mm depth)
    #cylinder(h=2.8, d=13.4);  // 2mm deep, 13mm diameter hole
    translate([-3+50, 7.5, 0])
    #cube([9, 13.4, 2.8]);
    
     // Magnet cutout #4 (centered on top surface)
    translate([6+42, 14+65.2, 0])  // Center XY, position at Z=3 (5mm height - 2mm depth)
    #cylinder(h=2.8, d=13.4);  // 2mm deep, 13mm diameter hole
    translate([-3+50, 7.5+65, 0])
    #cube([9, 13.4, 2.8]);
    

    
    
    }
   sphere(r=0.5, $fn=30); // Radius 2 sphere for rounding
}

// Motor Riser
minkowski() {
    difference() {
        // Riser
        rotate([-5,0,0])
            translate([0,0,2])
                cube([56, 6, 36]); // Original 60x7x40 reduced by 4mm
              //large cutout
         rotate([90,0,0])
            translate([28,50,-20])
                cylinder(h=40, r=25, $fn=100);     
         // Small cutout   
                rotate([90,0,0])
            translate([28,30,-20])
                cylinder(h=40, r=13, $fn=100);
                
           width = 10;        // Width across flats
           length = 30;      // Cylinder height

           // Calculate radius from width across flats for a regular hexagon
             radius = width / (2 * cos(30));  // cos(30°) = sqrt(3)/2
                
              rotate([90,0,0])
            translate([6,10,0])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
              
               rotate([90,0,0])
            translate([20,10,0])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
           
           rotate([90,0,0])
            translate([34,10,0])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
              
            rotate([90,0,0])
            translate([50,10,0])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
              
              
    }
    sphere(r=0.5, $fn=30);
    
    
}

//Handpiece Riser
minkowski() {
    difference() {
        translate([0,98,0])
            rotate([5,0,0])
                translate([0,-9.9,2])
                    cube([56, 8, 36]); // Original 60x7x40 reduced by 4mm
        //large cutout
         rotate([90,0,0])
            translate([28,50,-120])
                cylinder(h=40, r=25, $fn=100);     
         // Small cutout   
                rotate([90,0,0])
            translate([28,30,-120])
                cylinder(h=40, r=10, $fn=100);
        //Magnet cutout
         rotate([0,0,0])
            translate([28,90,8])
                cylinder(h=11, r=5.8, $fn=100);
                
                
                    width = 10;        // Width across flats
           length = 30;      // Cylinder height

           // Calculate radius from width across flats for a regular hexagon
             radius = width / (2 * cos(30));  // cos(30°) = sqrt(3)/2
                
              rotate([90,0,0])
            translate([6,10,-90])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
              
               rotate([90,0,0])
            translate([6,25,-90])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
           
           rotate([90,0,0])
            translate([50,25,-90])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
              
            rotate([90,0,0])
            translate([50,10,-90])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
              
                rotate([90,0,0])
            translate([15,18,-90])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
              
            rotate([90,0,0])
            translate([40,18,-90])  
              cylinder(h = length, r = radius, $fn = 6, center = true);
       
    }
    sphere(r=0.5, $fn=30);
}  

translate([0, 0, -4])
cube([56, 96, 3]); // Cube
