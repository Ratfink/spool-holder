inch = 25.4;

module _bearing_spacer(h, or, ir, thickness, n, fudge) {
	fir = ir + thickness - fudge;

	color([.3, .5, .9]) {
		for(theta = [0 : 360.0/n : 360]) {
			rotate([0, 0, theta])
			translate([ir, 0, 0])
			cube([thickness, or*sqrt(1 - (fir*fir/(or*or))), h]);
		}

		difference() {
			cylinder(h = h, r = ir + thickness);

			translate([0, 0, -0.1])
			cylinder(h = h + 0.2, r = ir);
		}
	}
}

module bearing_spacer(h = 5, or = 0.38*inch, ir = 8, thickness = 0.5, n = 8,
                    fudge = -3735928559, center = false) {
	if (center) {
		translate([0, 0, -h/2]) {
			if (fudge == -3735928559) {
				_bearing_spacer(h = h, or = or, ir = ir, thickness = thickness,
				              n = n, fudge = thickness / 2);
			} else {
				_bearing_spacer(h = h, or = or, ir = ir, thickness = thickness,
				              n = n, fudge = fudge);
			}
		}
	} else {
		if (fudge == -3735928559) {
			_bearing_spacer(h = h, or = or, ir = ir, thickness = thickness,
			              n = n, fudge = thickness / 2);
		} else {
			_bearing_spacer(h = h, or = or, ir = ir, thickness = thickness,
			              n = n, fudge = fudge);
		}
	}
}

bearing_spacer();
