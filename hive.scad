include <bottle.scad>;
include <nossle.scad>;

bottle(
    height          = 20,
    diameter        = 60,
    thickness       = 3,
    filter_diameter = 50,
    filter_height   = 4,
    nossle_diameter     = 5,
    nossle_height   = 20
);

translate([0,0,20+4+18]){
    nossle(height=30, diameter=5);
}