# Nouvag Stand

A parameterized OpenSCAD model of an ergonomic, stable table-top cradle designed to hold a Nouvag surgical micromotor and handpiece.

## Geometry and Features

- **Base Plate:** A rounded base of dimensions `56 x 96 x 5` mm (after Minkowski rounding) featuring slots for slide-in magnets (13.4mm diameter, 2.8mm depth).
- **Motor Riser (Front):** A `-5°` angled riser with dual circular cutouts (radius 25mm and 13mm) to hold the motor body and hexagonal key slots for access or auxiliary tool holding.
- **Handpiece Riser (Rear):** A `+5°` angled riser with circular cutouts (radius 25mm and 10mm), an integrated magnet cutout (radius 5.8mm, depth 11mm) at the center top, and additional hexagonal slots.
- **Bottom Plate (Optional):** A `56 x 96 x 3` mm thin plate below the base (`Z = -4` to `-1`) that can be toggled on/off using the `include_lower_baseplate` parameter.

## Manufacturing & Assembly Guidelines

### 1. Material & 3D Printing (HP MJF PA12)
*   **Material:** **PA12 (Nylon 12)** printed on **HP Multi Jet Fusion (MJF)** is highly recommended. It offers excellent mechanical properties, chemical resistance, and is fully autoclavable.
*   **Shrinkage & Tolerance:** MJF PA12 has a typical shrinkage rate of **1.5% to 2%**. The default magnet cutout diameters in `stand.scad` (13.4mm for the base magnets) include a +0.4mm tolerance buffer to allow a press-fit or slide-in fit after post-processing/bead blasting.
*   **Autoclave Compatibility:** MJF PA12 can easily withstand standard autoclave sterilization cycles (e.g., 121°C or 134°C) under no-load conditions.

### 2. Magnets
*   **Grade:** Use **High-Temperature Neodymium (NdFeB) Magnets** (grades ending in **EH** or **AH**, which are rated for up to 200°C and 220°C respectively). 
*   *Warning:* Standard neodymium magnets (N-grades) will permanently demagnetize above 80°C and cannot survive autoclave sterilization cycles.

### 3. Adhesive
*   To secure the magnets in their slots, use a high-temperature, autoclave-safe, and biocompatible epoxy (such as **Master Bond EP21LV** or **Epotek 353ND**). Standard cyanoacrylates (superglue) or hot glue will break down under autoclave steam and temperature.

## File Contents

- `stand.scad`: The primary OpenSCAD design file.
- `render_figures.ps1`: PowerShell script to render images of the stand.
