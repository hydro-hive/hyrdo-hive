module bottle(height, diameter, width){
    radius = diameter/2;

    difference() {
	cylinder(h=2, d=diameter);
	translate([0,0,-2])
	cylinder(h=5, d=50);
    }


    difference() {
	union(){
	    cylinder(d=diameter, h=height);
	    translate([0, 0, height]){
		sphere(d=diameter);
	    }
	}

	union(){
	    translate([0,0,-1]){
		cylinder(d=diameter-width, h=height);
		translate([0, 0, height]){
		    sphere(d=diameter-width);
		}
	    }
	}

	translate([0,0,height+radius-(width+1)]) {
	    cylinder(d=4, h=width+2);
	}
    }
}
