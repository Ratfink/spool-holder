include <polyhole.scad>;
include <nut.scad>;

inch = 25.4;

module cone_bushing(h = 7/8*inch, r1 = 5/8*inch, r2 = 3/16*inch,
                    hr = 9/16*inch, n = sae5f16) {
	color([.3, .5, .9])
	difference() {
		intersection() {
			cylinder(h = h, r1 = r1, r2 = r2);

			cylinder(h = h, r = hr, $fn = 6);
		}

		translate([0, 0, n[1]/2 + .1])
		polyhole(h = h, d = n[0]);

		translate([0, 0, -.1])
		cylinder(h = n[1]/2 + .1, r = 1.07*n[2]/sqrt(3), $fn = 6);
	}
}

cone_bushing();
