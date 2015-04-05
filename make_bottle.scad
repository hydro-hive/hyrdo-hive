include <bottle.scad>;
include <gopro.scad>;
//include <nossle.scad>;

bottle(
     height          = height,
     diameter        = diameter,
     thickness       = 3,
     filter_diameter = filter_diameter,
     filter_height   = filter_height,
     nossle_diameter = nossle_diameter,
     nossle_height   = nossle_height
 );

//nossle(height=30, diameter=5);

gopro_mounts(diameter = diameter);
