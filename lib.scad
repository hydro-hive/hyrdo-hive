module ring(diameter, height, width) {
    difference(){
	cylinder(h=height, d=diameter);
	translate([0,0,-1]){
	    cylinder(h=height+4, d=diameter-width);
	}
    }
}
