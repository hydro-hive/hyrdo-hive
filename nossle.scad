module nossle(height=30, innerTubeDiameter=5) {
    //innerTubeDiameter is simply the diameter of the opening in your tube
    difference() {
	cylinder(h=height, d=innerTubeDiameter, $fn=100);
	translate([0,0,-1]){
	    cylinder(h=height+10, d=innerTubeDiameter-1, $fn=100);
	}
    }
}

nossle();