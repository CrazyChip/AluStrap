//
// 20x20mm aluminium tubes,
// 400 mm lenght,
// 12mm rods,
// nema17 motors,
// lm12uu bearings

$fn=50;

// square tubes
include <tube.scad>;
// FRAME
color("Silver")
union(){
  // basement frame
  translate([190,0,0])   tube20();
  translate([-190,0,0])  tube20();
  translate([0,190,20])  rotate([0,0,90]) tube20();
  translate([0,-190,20]) rotate([0,0,90]) tube20();
  translate([10,195,40])  tube20(50);
  translate([10,-195,40]) tube20(50);
  //motor support
  translate([-190,0,20]) tube20(50);
  //608zz support
  translate([190,10,20]) tube20(50);
  translate([190,10,40]) tube20(50);
  // vertical parts
  translate([30,-210,210]) rotate([90,0,0]) tube20();
  translate([30,210,210])  rotate([90,0,0]) tube20();
  // top crossbar
  translate([10,0,400]) tube20(480);
  // 65 deg tubes
  translate([113,-210,150])  rotate([65,0,90]) tube20(300);
  translate([52.5,-230,280]) rotate([65,0,90]) tube20(110);
  translate([113,210,150])   rotate([65,0,90]) tube20(300);
  translate([52.5,230,280]) rotate([65,0,90]) tube20(110);
  // table
  translate([80,0,55])  tube20(250);
  translate([-80,0,55]) tube20(250);
  translate([0,90,35])  rotate([0,0,90]) uprofile(180);
  translate([0,-90,35]) rotate([0,0,90]) uprofile(180);
  // vertical carret
  translate([-25,-190,180]) rotate([90,0,270]) uprofile(120);
  translate([-25,190,180])  rotate([90,0,270]) uprofile(120);
  // horizontal carret
  translate([-22,0,220])  rotate([0,90,0]) uprofile(100);
  translate([-22,0,140])  rotate([0,90,0]) uprofile(100);
  translate([-2,30,180])  rotate([90,0,0]) tube20(100);
  translate([-2,-30,180]) rotate([90,0,0]) tube20(100);
  // belt fix
  //translate([-22,0,210]) tube20(100);
}

// RODS
color("DarkSlateGray")
union(){
  // horizontal rods
  translate([0,90,16])  rotate([0,90,0]) cylinder(h=400,d=12,center=true);
  translate([0,-90,16]) rotate([0,90,0]) cylinder(h=400,d=12,center=true);
  // vertical rods
  translate([-6,190,220])  cylinder(h=380,d=12,center=true);
  translate([-6,-190,220]) cylinder(h=380,d=12,center=true);
  // moving rods
  translate([-41,0,140]) rotate([90,0,0]) cylinder(h=400,d=12,center=true);
  translate([-41,0,220]) rotate([90,0,0]) cylinder(h=400,d=12,center=true);
}

// MOTORS
include <nema.scad>;
// vertical motors
translate([-21,221,10.5])  nema17();
translate([-21,-221,10.5]) nema17();
// bed motor
translate([-159,4,10]) nema17();
// head motor
translate([-54.5,168,180])rotate([0,90,0]) nema17();
// extruder
translate([159,159,10.5]) nema17();

// PULLEYS
include <pulley.scad>;
// table pulley
translate([-159,4,38]) pulley20();
// head pulley
translate([-25,168,180]) rotate([0,90,0]) pulley20();

// BEARINGS
include <lm.scad>;
// horizontal bearings
translate([50,90,16])   rotate([0,90,0]) lm12uu();
translate([50,-90,16])  rotate([0,90,0]) lm12uu();
translate([-50,90,16])  rotate([0,90,0]) lm12uu();
translate([-50,-90,16]) rotate([0,90,0]) lm12uu();
// vertical bearings
translate([-6,190,140])  lm12uu();
translate([-6,190,220])  lm12uu();
translate([-6,-190,140]) lm12uu();
translate([-6,-190,220]) lm12uu();
// head bearings
translate([-41,30,140])  rotate([90,0,0]) lm12uu();
translate([-41,30,220])  rotate([90,0,0]) lm12uu();
translate([-41,-30,140]) rotate([90,0,0]) lm12uu();
translate([-41,-30,220]) rotate([90,0,0]) lm12uu();

// HOT BED
color("Maroon")
translate([0,0,75]) cube(size=[220,250,2],center=true);
color("Green",0.3) translate([0,0,78]) cube(size=[220,220,4],center=true);
// bed springs
include <spring.scad>;
translate([80,117,65])   spring();
translate([-80,117,65])  spring();
translate([80,-117,65])  spring();
translate([-80,-117,65]) spring();

// THREADED RODS
include <rod.scad>;
translate([-21,221,200])  rod6();
translate([-21,-221,200]) rod6();
//[-21,221,10.5]

// SUPPORTS
include <support.scad>;
// bed shafts
// front supports
translate([-190,90,16])  rotate([0,90,0]) support12();
translate([-190,-90,16]) rotate([0,90,0]) support12();
// back supports
translate([190,90,16])  rotate([0,90,0]) support12();
translate([190,-90,16]) rotate([0,90,0]) support12();
// vertical shafts
// top supports
translate([-6,190,400])  support12();
translate([-6,-190,400]) support12();
// bottom supports
translate([-6,190,40])  support12();
translate([-6,-190,40]) support12();
// head shafts
// right supports
translate([-41,-190,140]) rotate([90,0,0]) support12();
translate([-41,-190,220]) rotate([90,0,0]) support12();
// left supports
translate([-41,190,220])  rotate([90,0,0]) support12();
translate([-41,190,140])  rotate([90,0,0]) support12();

// BELTS
// bed belt bearing
include <608zz.scad>;
translate([165,10,37]) 608zz();
// bed belt
color("Black"){
translate([5,0,38]) cube(size=[330,2,7],center=true);
translate([5,14,38]) rotate([0,0,2.2]) cube(size=[330,2,7],center=true);
}
// head belt bearing
translate([-25,-165,187]) rotate([90,180,90]) 608zz();
// head belt
color("Black"){
translate([-25,0,191]) rotate([-2.4,0,0]) cube(size=[7,335,2],center=true);
translate([-25,0,176]) cube(size=[7,335,2],center=true);
}
