module circle(diameter, height) {
    difference(){
	cylinder(h=height, d=diameter);
	translate([0,0,-1]){
	    cylinder(h=height+4, d=diameter-5);
	}
    }
}

module filter(diameter, height){
    inner= diameter/ 3;
    middle= diameter * 2/3;
    outer = diameter;

    circle(inner, height);
    circle(middle, height);
    circle(outer, height);

    translate([-1,-diameter/2,0]){
	cube([2,outer,height]);
    }
    translate([diameter/2,-1,0]){
	rotate([0,0,90]){
	    cube([2,outer,height]);
	}
    }
}

//filter(50, 4);
