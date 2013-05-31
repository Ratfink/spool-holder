include <polyhole.scad>;
include <units.scad>;

//         ID         Thick     Width
sae5f16 = [5/16*inch, .27*inch, .492*inch];

function nut_id(n) = n[0];
function nut_thick(n) = n[1];
function nut_width(n) = n[2];

module nut(n, center = false) {
	color([.6, .6, .6])
	difference() {
		cylinder(h = nut_thick(n), r = nut_width(n)/sqrt(3), center = center,
		         $fn = 6);
		translate([0, 0, -nut_thick(n)])
		polyhole(h = 4*nut_thick(n), d = nut_id(n));
	}
}
