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
  translate([190,0,20]) tube20(50);
  translate([190,0,40]) tube20(50);
  // vertical parts
  translate([30,-210,210]) rotate([90,0,0]) tube20();
  translate([30,210,210])  rotate([90,0,0]) tube20();
  // top crossbar
  translate([10,0,400]) tube20(440);
  // 65 deg tubes
  translate([113,-210,150]) rotate([65,0,90]) tube20(300);
  translate([113,210,150])  rotate([65,0,90]) tube20(300);
  // table
  translate([80,0,55])  tube20(250);
  translate([-80,0,55]) tube20(250);
  translate([0,90,35])  rotate([0,0,90]) uprofile(180);
  translate([0,-90,35]) rotate([0,0,90]) uprofile(180);
  // vertical carret
  translate([-25,-190,185]) rotate([90,0,270]) uprofile(130);
  translate([-25,190,185])  rotate([90,0,270]) uprofile(130);
  // horizontal carret
  translate([-22,0,190]) rotate([0,90,0]) uprofile(100);
  translate([-22,0,140]) rotate([0,90,0]) uprofile(100);
  translate([-2,30,165])  rotate([90,0,0]) tube20(70);
  translate([-2,-30,165]) rotate([90,0,0]) tube20(70);
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
  translate([-41,0,190]) rotate([90,0,0]) cylinder(h=400,d=12,center=true);
}

// MOTORS
include <nema.scad>;
// vertical motors
translate([-21,221,10.5])  nema17();
translate([-21,-221,10.5]) nema17();
// bed motor
translate([-221,0,10]) nema17();
// head motor
translate([-54.5,168,229])rotate([0,90,0]) nema17();
// extruder
translate([-180,221,10.5]) nema17();

// PULLEYS
include <pulley.scad>;
// table pulley
translate([-221,0,38]) pulley20();
// head pulley
translate([-25,168,229]) rotate([0,90,0]) pulley20();

// BEARINGS
include <lm.scad>;
// horizontal bearings
translate([50,90,16])   rotate([0,90,0]) lm12uu();
translate([50,-90,16])  rotate([0,90,0]) lm12uu();
translate([-50,90,16])  rotate([0,90,0]) lm12uu();
translate([-50,-90,16]) rotate([0,90,0]) lm12uu();
// vertical bearings
translate([-6,190,140])  lm12uu();
translate([-6,190,190])  lm12uu();
translate([-6,-190,140]) lm12uu();
translate([-6,-190,190]) lm12uu();
// head bearings
translate([-41,30,140])  rotate([90,0,0]) lm12uu();
translate([-41,30,190])  rotate([90,0,0]) lm12uu();
translate([-41,-30,140]) rotate([90,0,0]) lm12uu();
translate([-41,-30,190]) rotate([90,0,0]) lm12uu();

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
translate([-41,-190,190]) rotate([90,0,0]) support12();
// left supports
translate([-41,190,190])  rotate([90,0,0]) support12();
translate([-41,190,140])  rotate([90,0,0]) support12();

// BELTS
// bed belt bearing
include <608zz.scad>;
translate([165,0,37]) rotate([0,0,0]) 608zz();
// bed belt
color("Black"){
translate([-26,-8,37]) rotate([0,0,-1]) cube(size=[390,2,7],center=true);
translate([-26,8,37]) rotate([0,0,1]) cube(size=[390,2,7],center=true);
}