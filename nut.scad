include <colors.scad>;
include <polyhole.scad>;
include <units.scad>;

//         ID         Thick     Width
sae5f16 = [5/16*inch, .27*inch, .492*inch];

function nut_id(n) = n[0];
function nut_thick(n) = n[1];
function nut_width(n) = n[2];
function nut_radius(n) = nut_width(n)/sqrt(3);

module _nut(n) {
	color(nut_color)
	intersection() {
		difference() {
			cylinder(h = nut_thick(n), r = nut_radius(n), $fn = 6);

			translate([0, 0, -nut_thick(n)/2])
			polyhole(h = 2*nut_thick(n), d = nut_id(n));
		}
		union() {
			translate([0, 0, nut_thick(n)/6])
			cylinder(h = 2*nut_thick(n)/3, r = nut_radius(n), $fn = 6);

			translate([0, 0, 5*nut_thick(n)/6])
			cylinder(h = nut_thick(n)/6, r1 = nut_radius(n),
			         r2 = nut_width(n)/2);

			cylinder(h = nut_thick(n)/6, r1 = nut_width(n)/2,
			         r2 = nut_radius(n));
		}
	}
}

module nut(n, center = false) {
	if (center == true) {
		translate([0, 0, -nut_thick(n)/2])
		_nut(n);
	} else {
		_nut(n);
	}
}
