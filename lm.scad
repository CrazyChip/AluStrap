module lm12uu(
lm12uu_diameter=25,
lm12uu_lenght=32.5,
lm12uu_hole=12,
){
  // nice rendering
  //$fn=100;

  union(){
    // housing
    color("LightSteelBlue") difference(){
      cylinder(h=lm12uu_lenght,d=lm12uu_diameter,center=true);
      cylinder(h=lm12uu_lenght,d=lm12uu_diameter-4,center=true);
    }

    // collar
    color("DimGray") difference(){
      cylinder(h=lm12uu_lenght+2,d=lm12uu_diameter-4,center=true);
      cylinder(h=lm12uu_lenght+2,d=lm12uu_hole,center=true);
    }
  }
}

// use module
//lm12uu();
