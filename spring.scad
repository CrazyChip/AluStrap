module spring(
spring_len=25,
){
  color("Silver") linear_extrude(height=25,center=true,convexity=0,twist=360*20,slices=600){
    translate([2,0,0]) square([1,1],center=true);
  }
}

// use module
//spring();