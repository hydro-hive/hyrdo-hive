include <gopro_mounts_mooncactus.scad>;


module gopro_mounts(
    diameter = 60,
    )
{
    correction_y = diameter/2 + 1;
    translate([0,-correction_y,8])
        gopro_double();
    translate([0,correction_y,8])
        rotate([0,0,180])
        gopro_tripple();
}
