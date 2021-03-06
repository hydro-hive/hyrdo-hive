///////////////////////////////////////////////////////////////////////
//
// GoPro Hero mount and joint (gopro_mounts_mooncactus.scad) - Rev 1.03
//
///////////////////////////////////////////////////////////////////////
//
// CC-BY-NC 2013 jeremie.francois@gmail.com
// http://www.thingiverse.com/thing:62800
// http://betterprinter.blogspot.com
// 
// stripped by palipalo9@googlemail.com
//
// -------
// It slices neatly on an ultimaker with the following parameters
//
// 0.1 mm layers (for better look & more compact FDM) -- 0.15 is still OK (and faster)
// 0.8 mm walls (loops->infill->perimeters)
// 0.8 mm bottom/top
// 100% fill (probably safer, though 30% is quite OK)
//
// Rev 1.01: fixed printing angle vs captive nut slot, added a slight freeplay
// Rev 1.02: added handle/bar mount and rounded the angles of the rod mount
// Rec 1.03: examples and first release (20130317-1234)


// The locking nut on the gopro mount triple arm mount (keep it tight)
gopro_nut_d= 9.2;
// How deep is this nut embossing (keep it small to avoid over-overhangs)
gopro_nut_h= 2;
// Hole diameter for the two-arm mount part
gopro_holed_two= 5;
// Hole diameter for the three-arm mount part
gopro_holed_three= 5.5;
// Thickness of the internal arm in the 3-arm mount part
gopro_connector_th3_middle= 3.1;
// Thickness of the side arms in the 3-arm mount part
gopro_connector_th3_side= 2.7;
// Thickness of the arms in the 2-arm mount part
gopro_connector_th2= 3.04;
// The gap in the 3-arm mount part for the two-arm
gopro_connector_gap= 3.1;
// How round are the 2 and 3-arm parts
gopro_connector_roundness= 1;
// How thick are the mount walls
gopro_wall_th= 3;

gopro_connector_wall_tol=0.5+0;
gopro_tol=0.04+0;

// Can be queried from the outside
gopro_connector_z= 2*gopro_connector_th3_side+gopro_connector_th3_middle+2*gopro_connector_gap;
gopro_connector_x= gopro_connector_z;
gopro_connector_y= gopro_connector_z/2+gopro_wall_th;


module gopro_tripple(withnut=true) {
    translate([0,-gopro_connector_y,0])
        gopro_connector("triple", withnut=withnut);
}

module gopro_double(){
    translate([0,-gopro_connector_y,0])
        gopro_connector("double");
}


// ===== GOPRO CONNECTOR ==============


module gopro_connector(
        version="double", 
        withnut=true, 
        captive_nut_th=0, 
        captive_nut_od=0, 
        captive_rod_id=0, 
        captive_nut_angle=0)
{
    module gopro_torus(r,rnd)
    {
        translate([0,0,rnd/2])
            rotate_extrude(convexity= 10)
            translate([r-rnd/2, 0, 0])
            circle(r= rnd/2, $fs=0.2);
    }
    module gopro_profile(th)
    {
        hull()
		{
            gopro_torus(r=gopro_connector_z/2, rnd=gopro_connector_roundness);
            translate([0,0,th-gopro_connector_roundness])
                gopro_torus(r=gopro_connector_z/2, rnd=gopro_connector_roundness);
            translate([-gopro_connector_z/2,gopro_connector_z/2,0])
                cube([gopro_connector_z,gopro_wall_th,th]);
        }
    }
    difference()
	{
        union()
        {
            if(version=="double")
            {
                for(mz=[-1:2:+1]) scale([1,1,mz])
                    translate([0,0,gopro_connector_th3_middle/2 + (gopro_connector_gap-gopro_connector_th2)/2])
                        gopro_profile(gopro_connector_th2);
            }
            if(version=="triple")
            {
                translate([0,0,-gopro_connector_th3_middle/2]) gopro_profile(gopro_connector_th3_middle);
                for(mz=[-1:2:+1]) scale([1,1,mz])
                    translate([0,0,gopro_connector_th3_middle/2 + gopro_connector_gap]) 
                        gopro_profile(gopro_connector_th3_side);
            }

			// add the common wall
            translate([0,gopro_connector_z/2+gopro_wall_th/2+gopro_connector_wall_tol,0])
                cube([gopro_connector_z,gopro_wall_th,gopro_connector_z], center=true);

			// add the optional nut emboss
			if(version=="triple" && withnut)
			{
				translate([0,0,gopro_connector_z/2-gopro_tol])
				difference()
				{
					cylinder(r1=gopro_connector_z/2-gopro_connector_roundness/2, r2=11.5/2, h=gopro_nut_h+gopro_tol);
					cylinder(r=gopro_nut_d/2, h=gopro_connector_z/2+3.5+gopro_tol, $fn=6);
				}
			}
		}
		// remove the axis
		translate([0,0,-gopro_tol])
			cylinder(r=(version=="double" ? gopro_holed_two : gopro_holed_three)/2, h=gopro_connector_z+4*gopro_tol, center=true, $fs=1);
	}
}

