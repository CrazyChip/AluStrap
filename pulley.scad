module pulley20(
pulley_n=20,
pulley_d=9,
pulley_h=6,
pulley_tooth=2,
){

// nice rendering
$fn=25;

difference(){
  // body
  color("DarkKhaki") cylinder(r=pulley_d/2,h=pulley_h,center=true);
  union(){
    // teeth
    for(i=[1:pulley_n]){
    angle = i*360/pulley_n;
    rotate(angle,[0,0,1]) translate([pulley_d/2,0,0]) cylinder(d=pulley_tooth/2,h=pulley_h+1,center=true);
    }
  }
}
// shaft hole
color("Grey") cylinder(d=5,h=pulley_h+2.5,center=true);
// top cap
color("Silver") translate([0,0,pulley_h/2+0.5]) cylinder(d=pulley_d+1,h=1,center=true);
// bottom cap
color("Silver") translate([0,0,-pulley_h/2-1.5]) cylinder(d=pulley_d+1,h=3,center=true);
}

// use module
//pulley20();
