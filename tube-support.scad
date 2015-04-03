module tubeHolderMount(outerDiameter) {
    difference() {
	cylinder(h=4, d=outerDiameter+3, $fs=1);
	translate([0,0,-1]){
	    cylinder(h=6, d=outerDiameter, $fs=1);
	}
    }
}

module tubeHolder(outerDiameter=7) {
    radius=outerDiameter/2;
    cube(size=[4,20,4]);
    translate([2,20+radius,0]){
	tubeHolderMount(outerDiameter);
    }
}

tubeHolder(7);