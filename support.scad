module support12(
shaft_d=12,
bolt_d=4,
top_margin=3,
){
  
  // nice rendering
  $fn=30;
  
  difference(){
    translate([-top_margin/2,0,0]) cube([shaft_d+top_margin-0.2,(shaft_d+bolt_d*2+4),shaft_d],center=true);
    union(){
      cylinder(h=shaft_d+1,d=shaft_d,center=true);
      translate([shaft_d/4,0,0]) cube([shaft_d/2+0.1,shaft_d,shaft_d+1],center=true);
    }
    translate([-top_margin+1,(shaft_d/2+bolt_d/2+1),0]) rotate([0,90,0]) cylinder(h=(shaft_d+top_margin+3),d=bolt_d+1,center=true);
    translate([-top_margin+1,-(shaft_d/2+bolt_d/2+1),0]) rotate([0,90,0]) cylinder(h=(shaft_d+top_margin+3),d=bolt_d+1,center=true);
  }
}

// use module
//support12();