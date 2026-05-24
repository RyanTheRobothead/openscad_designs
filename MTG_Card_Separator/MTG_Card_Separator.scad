//Card Separator for MTG Deck Boxes

height = 96;
width = 70;
thickness = 1;
corner_cutout_height = 8;
corner_cutout_width = 8;
rounding_radius = 3;

linear_extrude(thickness)
    offset( r =  rounding_radius, $fn=64)   // ④ re-expand  → convex corners now smooth
    offset( r = -rounding_radius, $fn=64)   // ③ shrink     → clips convex sharpness
    offset( r = -rounding_radius, $fn=64)   // ② shrink     → reverts expansion
    offset( r =  rounding_radius, $fn=64)   // ① expand     → fills concave inner corner
    difference() {
        square([width, height]);
        square([corner_cutout_width, corner_cutout_height]);  // cuts bottom-left corner
        translate([width - corner_cutout_width, 0])
            square([corner_cutout_width, corner_cutout_height]); // cuts bottom-right corner
        translate([0, height - corner_cutout_height])
            square([corner_cutout_width, corner_cutout_height]); // cuts top-left corner
        translate([width - corner_cutout_width, height - corner_cutout_height])
            square([corner_cutout_width, corner_cutout_height]); // cuts top-right corner
}
