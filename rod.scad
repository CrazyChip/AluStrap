module rod6(){
  // nice rendering
  $fn=50;
  
  // thread
  color("Silver") linear_extrude(height=250,center=true,convexity=0,twist=360*200,slices=3000){
    translate([2,0,0]) square([1,1],center=true);
  }
  // rod
  color("Grey") cylinder(h=250,d=4,center=true);
  // coupling
  color("SandyBrown",0.7) translate([0,0,-125]) cylinder(h=30,d=8,center=true);
}

// use module
//rod6();
