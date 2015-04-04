include <lib.scad>;

module nossle(height=30, innerTubeDiameter=5, skirtHeight=2, skirtWidth=5) {
    //innerTubeDiameter is simply the diameter of the opening in your tube
    ring(innerTubeDiameter, height, 1, $fn=100);
    ring(innerTubeDiameter+skirtWidth, skirtHeight, skirtWidth, $fn=100);
}
