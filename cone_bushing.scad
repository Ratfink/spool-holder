include <colors.scad>;
include <nut.scad>;
include <polyhole.scad>;
include <units.scad>;

module cone_bushing(h = 7/8*inch, r1 = 5/8*inch, r2 = 3/16*inch,
                    hr = 9/16*inch, n = sae5f16) {
	color(nylon_color)
	difference() {
		intersection() {
			cylinder(h = h, r1 = r1, r2 = r2);

			cylinder(h = h, r = hr, $fn = 6);
		}

		translate([0, 0, nut_thick(n)/2 + .1*mm])
		polyhole(h = h, d = nut_id(n));

		translate([0, 0, -.1*mm])
		cylinder(h = nut_thick(n)/2 + .1*mm, r = 1.07*nut_radius(n), $fn = 6);
	}
}

cone_bushing();
