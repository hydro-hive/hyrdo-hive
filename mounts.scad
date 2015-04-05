module hole(){
    translate([-5,0,-2])
    difference(){
	hull(){
	    cube([10,5,4]);
	    translate([5,8,0]){
		cylinder(d=10, h=4);
	    }
	}
	translate([5,8,-1]){
	    cylinder(d=5, h=6);
	}
    }
}

module hole_mount(diameter){
    radius=diameter/2;

    translate([0,0,2]){
	translate([0,radius-1,0]){
	    hole();
	}

	translate([0,-radius+1,0]){
	    rotate([-180,0,0]){
		hole();
	    }
	}
    }
}

module mount(diameter, gopro=false) {
    if (gopro == true){
    } else {
	hole_mount(diameter=diameter);
    }
}
