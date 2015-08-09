module tube20(
tube_lenght=400,
){

  difference() {
    cube(size=[20,tube_lenght,20], center=true);
    cube(size=[16,tube_lenght+1,16], center=true);
  }
}

module uprofile(
tube_lenght=300,
){

  difference() {
    cube(size=[20,tube_lenght,20], center=true);
    translate([0,0,-2]) cube(size=[16,tube_lenght+1,20], center=true);
  }
}
// use module
//tube20();
//uprofile();
