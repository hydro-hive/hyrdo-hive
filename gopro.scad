include <gopro_mounts_mooncactus.scad>;


module gopro_mounts(
    diameter = 60,
    )
{
    correction_y = diameter/2 + 1;
    correction_z = 7.4;
    translate([0,-correction_y,correction_z])
        gopro_double();
    translate([0,correction_y,correction_z])
        rotate([0,0,180])
        gopro_tripple();
}
