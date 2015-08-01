module tube20(
tube_lenght=400,
){

  difference() {
    cube(size=[20,tube_lenght,20], center=true);
    cube(size=[16,tube_lenght,16], center=true);
  }
}

// use module
//tube20();
