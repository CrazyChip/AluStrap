module lm12uu(
lm12uu_diameter=25,
lm12uu_lenght=32.5,
lm12uu_hole=12,
){
  // nice rendering
  //$fn=100;

  difference(){
    union(){
      // housing
      color("LightSteelBlue")
      cylinder(h=lm12uu_lenght,d=lm12uu_diameter,center=true);
      // collar
      color("DimGray")
      cylinder(h=lm12uu_lenght+2,d=lm12uu_diameter-3,center=true);
    }
    cylinder(h=lm12uu_lenght+3,d=lm12uu_hole,center=true);
  }
}

// use module
//lm12uu();