module 608zz(){
  difference(){
    cylinder(d=22,h=7,center=true);
    cylinder(d=8,h=7,center=true);
  }
  difference(){
    cylinder(d=18,h=8,center=true);
    cylinder(d=12,h=8,center=true);
  }
  
  translate([0,0,5]) cube([30,20,1],center=true);
  translate([0,0,-5]) cube([30,20,1],center=true);
  translate([15,0,0]) rotate([0,90,0]) cube([11,20,1],center=true);
}

// use module
//608zz();
