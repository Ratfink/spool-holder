use <polyhole.scad>;

inch = 25.4;

//         ID         Thick     Width
sae5f16 = [5/16*inch, .27*inch, .492*inch];

module nut(n, center = false) {
	color([.6, .6, .6])
	difference() {
		cylinder(h = n[1], r = n[2]/sqrt(3), center = center, $fn = 6);
		translate([0, 0, -n[1]])
		polyhole(h = 4*n[1], d = n[0]);
	}
}
