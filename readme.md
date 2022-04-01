# babyv case

<!-- put the nicest photo here -->

I really loved the alice-inspired ortholinear layout by eyeohdesigns, but I also really loved the (now discontinued) rounded and thick bezeled 3d printed case of the prime-e by p3d.
This is my attempt to marry the 2 designs with some inspiration from the multipart flurples c13x qaz alice style keyboard.

<!-- change this path to match the actual github link
<script src="https://embed.github.com/view/3d/kevin-nel/babyvcase/master/case/case.stl"></script>
-->

## todo

- [x] fix issues with stabiliser in plate
- [ ] add hole in case for promicro (scad)
- [ ] add holes in inner-case and bottom for screws (scad)
- [ ] finalise dimensions (MS 3D Builder)
- [ ] round top in blender
- [ ] split and add keys in tinkercad
- [ ] setup print jobs (gcode)

## a short summary of the very long winded design process

Due to my stubbornness :ox: and unwilingness to learn how to use a real CAD package (like freeCAD or fusion360), my design workflow goes like this:

```mermaid
flowchart
    A[edited svgs from a <br> laser cut case generator] --> B[openscad script  <br> to make case files];
    B --> C[mesh editing in blender <br> for bevels and round curvy bits];
    C --> D[tinkercad <br> to splice the files for actual printing];
    D --> E[realise something isn't quite right <br> and needs to be changed in the original svg];
    E-->A;
```

### a slighly longer summary

1. used the [svgs that were in the casefiles folder of the eyeohdesigns babyv repo](https://github.com/joedinkle/eyeohdesigns/tree/main/keyboards/babyv/casefiles) as starting point and edited them so that I had separate files for holes, outline, switch holes, and a top cutout. A little bit of editing was also done to the svgs to move the holes around.
2. openscad script to generate the stls for a 4 part case (bottom, case-inner, plate, case-top)
3. stabilisers:
    - original plate svg did not fit my stabs so I used the ``keyboardlayout.json`` from the [vial qmk repo](https://github.com/vial-kb/vial-qmk/blob/vial/keyboards/eyeohdesigns/babyv/keymaps/vial/vial.json) and generated a new svg of the plate in [builder.swillkb](http://www.builder.swillkb.com/)
    - needed to [flip the stabiliser cutout](https://builder-docs.swillkb.com/features/) by adding ``_rs:180`` to the key in the ``kle.json``
    - after some more test prints it was found that the cherry stab cutout fit best but needed some more room for the stabiliser wire, this was achieved by subtracting 2 rectangular prisms to make more room.
4. bevels and fine touches were added to the case top in blender
5. sliced up the model and added slots and keys to make for a stronger connection
6. imported the model into prusaslicer and split it into the separate objects and printed.

## the build

### handwiring and firmware

this pro micro diagram proves helpful for every handwire

![pro micro pin names](./img/promicropins.jpg)

#### wiring

<!-- insert images of diode twisting, rows and columns and mcu all connected -->

#### firmware

I pretty much just copied the firmware from my previous builds and modified the keymap.c using the firmware available for the babyv on the vial qmk fork.

## final product

<!-- glory shots (also put the nicest photo at the top of the readme) -->
