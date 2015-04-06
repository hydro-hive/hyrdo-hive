include <bottle-simple.scad>
include <mounts.scad>

bottle(
    height=height,
    diameter=diameter,
    width=width
);

mount(diameter=diameter);
