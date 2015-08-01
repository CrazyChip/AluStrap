//
// 20x20mm aluminium tubes,
// 400 mm lenght,
// 12mm rods,
// nema17 motors,
// lm12uu bearings

$fn=50;

// square tubes
include <tube.scad>;
color("Silver")
union(){
  // base
  translate([190,0,0])   tube20();
  translate([-190,0,0])  tube20();
  translate([0,190,20])  rotate([0,0,90]) tube20();
  translate([0,-190,20]) rotate([0,0,90]) tube20();
  // vertical parts
  translate([50,-190,180]) rotate([90,0,0]) tube20(300);
  translate([50,190,180])  rotate([90,0,0]) tube20(300);
  // top crossbar
  translate([30,0,320]) tube20(420);
  // 60 deg
  translate([113,-210,150]) rotate([65,0,90]) tube20(300);
  translate([113,210,150])  rotate([65,0,90]) tube20(300);
  // table
  translate([80,0,38])  tube20(160);
  translate([-80,0,38]) tube20(160);
  translate([0,90,38])  rotate([0,0,90])  tube20(230);
  translate([0,-90,38]) rotate([0,0,90]) tube20(230);
}

// rods
color("DarkSlateGray")
union(){
  // horizontal rods
  translate([0,90,16])  rotate([0,90,0]) cylinder(h=400,d=12,center=true);
  translate([0,-90,16]) rotate([0,90,0]) cylinder(h=400,d=12,center=true);
  // vertical rods
  translate([14,190,180])  cylinder(h=300,d=12,center=true);
  translate([14,-190,180]) cylinder(h=300,d=12,center=true);
  // moving rods
  translate([-4,0,115]) rotate([90,0,0]) cylinder(h=400,d=12,center=true);
  translate([-4,0,165]) rotate([90,0,0]) cylinder(h=400,d=12,center=true);
}

// motors
include <nema.scad>;
// vertical motors
translate([19,221,10])  nema17();
translate([19,-221,10]) nema17();
// bed motor
translate([-221,30,22]) rotate([90,0,0]) nema17();
// head motor
translate([5,230,140]) rotate([0,90,0])  nema17();
// extruder
translate([-180,221,10]) nema17();

// pulleys
include <pulley.scad>;
// table pulley
translate([-221,0,22]) rotate([90,0,0])  pulley20();
// head pulley
translate([35,230,140]) rotate([0,90,0]) pulley20();

// bearings
include <lm.scad>;
// horizontal bearings
translate([50,90,16])   rotate([0,90,0]) lm12uu();
translate([50,-90,16])  rotate([0,90,0]) lm12uu();
translate([-50,90,16])  rotate([0,90,0]) lm12uu();
translate([-50,-90,16]) rotate([0,90,0]) lm12uu();
// vertical bearings
translate([14,190,115])  lm12uu();
translate([14,190,166])  lm12uu();
translate([14,-190,115]) lm12uu();
translate([14,-190,165]) lm12uu();
// head bearings
translate([-4,30,115])  rotate([90,0,0]) lm12uu();
translate([-4,30,165])  rotate([90,0,0]) lm12uu();
translate([-4,-30,115]) rotate([90,0,0]) lm12uu();
translate([-4,-30,165]) rotate([90,0,0]) lm12uu();

// hot bed
color("Maroon")
translate([0,0,49]) cube(size=[230,230,2],center=true);
color("Green",0.3) translate([0,0,51]) cube(size=[200,230,4],center=true);

// threaded rod
include <rod.scad>;
translate([19,221,175])  rod25();
translate([19,-221,175]) rod25();

// shaft supports
include <support.scad>;
// bed shafts
// front supports
translate([-190,90,16]) rotate([0,90,0]) support12();
translate([-190,-90,16]) rotate([0,90,0]) support12();
// back supports
translate([190,90,16]) rotate([0,90,0]) support12();
translate([190,-90,16]) rotate([0,90,0]) support12();
// vertical shafts
// top supports
translate([14,190,320]) support12();
translate([14,-190,320]) support12();

// belt bearings
include <608zz.scad>;
translate([165,0,15.5]) rotate([90,0,0]) 608zz();

// belt
color("Black"){
translate([-26,0,11]) rotate([0,2,0]) cube(size=[390,7,1],center=true);
translate([-26,0,27]) rotate([0,0,0]) cube(size=[390,7,1],center=true);
}
