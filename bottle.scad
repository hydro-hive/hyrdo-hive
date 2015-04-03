
cm = 1 ; 


height    = 9 * cm ;
size      = 8 * cm ; 
thickness = 1 * cm ; 

extruder_height = 3 * cm ; 


// upper body 
difference(){
    linear_extrude(
            height = height, 
            center = false, 
            convexity = 10
            ){
        square( size , center=true);
    };
    translate([0,0,-height]){
    linear_extrude(
            height = height * 3, 
            center = false, 
            convexity = 10
            ){
        square( size - thickness , center=true);
    }
    }
}


//linear_extrude(
//height = extruder_height, 
//center = false, 
//convexity = 10, 
//scale = 0.3){
    //square( size , center=true);
//}

