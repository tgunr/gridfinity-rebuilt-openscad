# gridfinity-rebuilt-baseplate

To round out the rebuilt catalog, we have baseplates. Originally, baseplates were not included as there was not anything really interesting to parameterize, unlike with bins. However, upon closer inspection, there is a couple things that would make peoples' lives easier. For instance, what is called here the "skeletonized" style, in that the baseplate is still thick to allow for magnets, but the center portion is removed. Additionally, being able to generate spacers for the sides of the bases, so that they fit perfectly inside your drawers.

![Bin](images/baseplate.gif)

## Script Parameters

Parameter | Range | Description
--- | ----- | ---
gridx | { n>=0 \| n∈R } | number of bases along the x-axis<br> If set to zero, will fill with as many <br>bases that fit within `distancex`
gridy | { n>=0 \| n∈R } | number of bases along the y-axis<br> If set to zero, will fill with as many <br>bases that fit within `distancey`
length | { n>0 \| n∈R } | length of one unit of the base. <br> default: 42 (The Answer to the Ultimate Question of Life, <br>the Universe, and Everything.)
distancex | { n>0 \| n∈R } | minimum length of baseplate along x <br>alternatively, how large is the drawer along x <br>(leave zero to ignore)
distancey | { n>0 \| n∈R } | minimum length of baseplate along y <br>alternatively, how large is the drawer along y <br>(leave zero to ignore)
fitx | { -1<=n<=1 \| n∈R } | alignment factor for extra space along x axis<br>(used when expansion_mode_x is "both")
fity | { -1<=n<=1 \| n∈R } | alignment factor for extra space along y axis<br>(used when expansion_mode_y is "both")
expansion_mode_x | { "both", "left_only", "right_only" } | directional expansion mode for X axis<br>     • "both" - expand equally on both sides (default)<br>     • "left_only" - expand only to the left<br>     • "right_only" - expand only to the right
expansion_mode_y | { "both", "bottom_only", "top_only" } | directional expansion mode for Y axis<br>     • "both" - expand equally on both sides (default)<br>     • "bottom_only" - expand only downward<br>     • "top_only" - expand only upward
style_plate | { 0, 1, 2 } | the style of baseplate <br>     • (0) thin (minimum material, only outline) <br>     • (1) weighted (thick with space for tire iron) <br>     • (2) skeletonized (thick, center hollowed)
enable_magnet | boolean | toggle hole for magnet on top
style_hole | { 0, 1, 2 } | the style of holes underneath the baseplate, if applicable <br>     • (0) none <br>     • (1) countersink <br>     • (2) counterbore

## Magnet Hole Options

The baseplate supports various magnet hole configurations through the `hole_options` parameter. You can customize magnet holes using the `bundle_hole_options()` function:

### Basic Magnet Hole Options

- **magnet_hole**: Enable/disable magnet holes (default: false)
- **crush_ribs**: Add crush ribs for better magnet retention (default: false)
- **chamfer**: Add chamfer to hole edges (default: false)
- **supportless**: Make holes printable without supports (default: false)
- **enclosed**: Create enclosed magnet holes for print-pause-insert-resume workflow (default: false)

### Enclosed Magnet Holes

The `enclosed` option creates magnet holes with a thin layer (0.3mm) covering the hole, enabling a special 3D printing workflow:

**Magnet Specifications:**
- **Size**: 6mm diameter × 2mm height (standard cylindrical magnets)
- **Hole Diameter**: 6.5mm (slightly oversized for easy insertion)
- **Hole Depth**: 2.4mm (accommodates magnet + tolerance layers)

**Print-Pause-Insert-Resume Workflow:**

1. **Print**: Print the model with enclosed holes - the thin 0.2mm layer will be visible in your slicer preview
2. **Pause**: Pause the print when the thin layer completes (slicer will show where to pause)
3. **Insert**: Insert 6×2mm magnets into the holes through the thin layer
4. **Resume**: Resume printing to enclose/embed the magnets within the model

**Important Notes:**
- ✅ The thin layer showing in slicer preview is **expected behavior** - this is what you print first
- ✅ Slicer will show exactly where to pause for magnet insertion
- ❌ Chamfer is automatically disabled with enclosed holes for better printability
- ✅ Crush ribs work normally with enclosed holes

**Usage Example:**
```openscad
// Create enclosed magnet holes for print-pause-insert workflow
hole_options = bundle_hole_options(
    magnet_hole=true,
    enclosed=true,        // Creates thin layer over hole
    crush_ribs=true,      // Still works with enclosed holes
    chamfer=false         // Chamfer disabled with enclosed holes
);

// Use in baseplate
gridfinityBaseplate([2, 2], l_grid, [0, 0], 1, hole_options, 0, [0, 0]);
```

## Modules

### gridfinityBaseplate

Generates a baseplate to use with gridfinity bins.

** `gridfinityBaseplate(gridx, gridy, length, distancex, distancey, style_plate, enable_magnet, style_hole, fitx, fity, expansion_mode_x, expansion_mode_y)` **

Parameter | Range | Description
--- | ----- | ---
gridx | { n>=0 \| n∈R } | number of bases along the x-axis<br> If set to zero, will fill with as many <br>bases that fit within `distancex`
gridy | { n>=0 \| n∈R } | number of bases along the y-axis<br> If set to zero, will fill with as many <br>bases that fit within `distancey`
length | { n>0 \| n∈R } | length of one unit of the base. <br> default: 42 (The Answer to the Ultimate Question of Life, <br>the Universe, and Everything.)
distancex | { n>0 \| n∈R } | minimum length of baseplate along x <br>alternatively, how large is the drawer along x <br>(leave zero to ignore)
distancey | { n>0 \| n∈R } | minimum length of baseplate along y <br>alternatively, how large is the drawer along y <br>(leave zero to ignore)
fitx | { -1<=n<=1 \| n∈R } | alignment factor for extra space along x axis<br>(used when expansion_mode_x is "both")
fity | { -1<=n<=1 \| n∈R } | alignment factor for extra space along y axis<br>(used when expansion_mode_y is "both")
expansion_mode_x | { "both", "left_only", "right_only" } | directional expansion mode for X axis<br>     • "both" - expand equally on both sides (default)<br>     • "left_only" - expand only to the left<br>     • "right_only" - expand only to the right
expansion_mode_y | { "both", "bottom_only", "top_only" } | directional expansion mode for Y axis<br>     • "both" - expand equally on both sides (default)<br>     • "bottom_only" - expand only downward<br>     • "top_only" - expand only upward
style_plate | { 0, 1, 2 } | the style of baseplate <br>     • (0) thin (minimum material, only outline) <br>     • (1) weighted (thick with space for tire iron) <br>     • (2) skeletonized (thick, center hollowed)
enable_magnet | boolean | toggle hole for magnet on top
style_hole | { 0, 1, 2 } | the style of holes underneath the baseplate, if applicable <br>     • (0) none <br>     • (1) countersink <br>     • (2) counterbore
