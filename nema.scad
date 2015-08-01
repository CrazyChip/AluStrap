module nema17(
nema_height=38,
nema_width=42,
nema_shaft=5,
){
  // nice rendering
  //$fn=50;

  union(){
    // base
    color("Silver") minkowski(){
      cube([nema_width-10,nema_width-10,nema_height],center=true);
      cylinder(r=5,h=1,center=true);
    }
    color("Black") minkowski(){
      cube([nema_width-9,nema_width-9,nema_height/3],center=true);
      cylinder(r=5,h=1,center=true);
    }
    
    // shaft
    color("Gray") cylinder(r=nema_shaft/2,h=nema_height);
    
    // ring
    color("Silver") translate([0,0,nema_height/2+1]) difference(){
      cylinder(r=11,h=2,center=true);
      cylinder(r=8,h=2,center=true);
    }
  }
}

// use module
//nema17();
