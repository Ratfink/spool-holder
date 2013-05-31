include <colors.scad>;
include <units.scad>;

module _solder_spool(h, r, ir, sr, thickness, tr, th) {
	// Spool
	color(solder_spool_color)
	difference() {
		// Body
		union() {
			cylinder(h = thickness, r = r);

			translate([0, 0, h - thickness])
			cylinder(h = thickness, r = r);

			translate([0, 0, thickness])
			cylinder(h = h - 2*thickness, r = ir + thickness);
		}

		// Cut the hole through the middle
		translate([0, 0, -0.5*inch])
		cylinder(h = h + 1*inch, r = ir);

		// Bottom triangles
		hull() {
			translate([0, 0, thickness + tr + th])
			rotate([90, 0, 0])
			cylinder(r = tr, h = 2*ir + 1*inch, center = true);

			translate([th, 0, thickness + tr])
			rotate([90, 0, 0])
			cylinder(r = tr, h = 2*ir + 1*inch, center = true);

			translate([-th, 0, thickness + tr])
			rotate([90, 0, 0])
			cylinder(r = tr, h = 2*ir + 1*inch, center = true);
		}

		// Top triangles
		hull() {
			translate([0, 0, h - thickness - tr - th])
			rotate([90, 0, 0])
			cylinder(r = tr, h = 2*ir + 1*inch, center = true);

			translate([th, 0, h - thickness - tr])
			rotate([90, 0, 0])
			cylinder(r = tr, h = 2*ir + 1*inch, center = true);

			translate([-th, 0, h - thickness - tr])
			rotate([90, 0, 0])
			cylinder(r = tr, h = 2*ir + 1*inch, center = true);
		}
	}

	// Solder
	color(solder_color)
	difference() {
		translate([0, 0, thickness])
		cylinder(h = h - 2*thickness, r = sr);

		translate([0, 0, -0.5*inch])
		cylinder(h = h + 1*inch, r = ir + thickness);
	}
}

module solder_spool(h = 2.25*inch, r = 1.075*inch, ir = 0.38*inch,
                    sr = -3735928559, thickness = 0.075*inch, tr = 0.025*inch,
                    th = 0.15*inch, center = false) {
	default_sr = sqrt(r*r/2 + (ir+thickness)*(ir+thickness)/2);
	if (center) {
		translate([0, 0, -h/2]) {
			if (sr == -3735928559) {
				_solder_spool(h = h, r = r, ir = ir, sr = default_sr,
				              thickness = thickness, tr = tr, th = th);
			} else {
				_solder_spool(h = h, r = r, ir = ir, sr = sr,
				              thickness = thickness, tr = tr, th = th);
			}
		}
	} else {
		if (sr == -3735928559) {
			_solder_spool(h = h, r = r, ir = ir, sr = default_sr,
			              thickness = thickness, tr = tr, th = th);
		} else {
			_solder_spool(h = h, r = r, ir = ir, sr = sr,
			              thickness = thickness, tr = tr, th = th);
		}
	}
}

solder_spool();
