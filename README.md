# Nouvag Stand

A parameterized OpenSCAD model of an ergonomic, stable table-top cradle designed to hold a Nouvag surgical micromotor and handpiece.

## Geometry and Features

- **Base Plate:** A rounded base of dimensions `56 x 96 x 5` mm (after Minkowski rounding) featuring slots for slide-in magnets (13.4mm diameter, 2.8mm depth).
- **Motor Riser (Front):** A `-5°` angled riser with dual circular cutouts (radius 25mm and 13mm) to hold the motor body and hexagonal key slots for access or auxiliary tool holding.
- **Handpiece Riser (Rear):** A `+5°` angled riser with circular cutouts (radius 25mm and 10mm), an integrated magnet cutout (radius 5.8mm, depth 11mm) at the center top, and additional hexagonal slots.
- **Bottom Plate & Torus Cutouts:** A `56 x 96 x 3` mm thin plate below the base (`Z = -4` to `-1`) featuring 5 subtracted torus shapes (4 corners + 1 center) for structural weight relief, grip, or custom indexing.

## File Contents

- `stand.scad`: The primary OpenSCAD design file.
- `render_figures.ps1`: PowerShell script to render images of the stand.
