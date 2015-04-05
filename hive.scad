include <bottle.scad>;
include <gopro.scad>;
//include <nossle.scad>;

bottle(
     height          = 20,
     diameter        = 100,
     thickness       = 3,
     filter_diameter = 50,
     filter_height   = 4,
     nossle_diameter     = 5,
     nossle_height   = 20
 );

//nossle(height=30, diameter=5);

gopro_mounts(diameter = 100);
