# babyv case

<!-- put the nicest photo here -->

I really loved the alice-inspired ortholinear layout by eyeohdesigns, but I also really loved the (now discontinued) rounded and thick bezeled 3d printed case of the prime-e by p3d.
This is my attempt to marry the 2 designs with some inspiration from the multipart flurples c13x qaz alice style keyboard.

<!-- change this path to match the actual github link
<script src="https://embed.github.com/view/3d/kevin-nel/babyvcase/master/case/case.stl"></script>
-->

## todo

- [x] fix issues with stabiliser in plate
- [x] add hole in case for promicro (scad)
- [x] add holes in inner-case and bottom for screws (scad)
- [x] finalise dimensions (MS 3D Builder)
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

### some images of the design process

design in openscad
![openscad](img/openscad1.png)
tweaking the mesh in blender (adding bevel on the top case and chamfering the usb hole)
![blender](img/blender1.png)
getting model ready to print in tinkercad
![tinkercad split](img/tinkercad1.png)
![tinkercad keying](img/tinkercad2.png)
test prints to make sure the dimensions are right for the switches and stabilisers
![test prints of the plate](img/test-prints.jpg)
printing the case
![prusa slicer job](img/prusa.png)

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

## useful links

- [gateron switch datasheet](https://objects.githubusercontent.com/github-production-repository-file-5c1aeb/50147694/6528571?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220401%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220401T144217Z&X-Amz-Expires=300&X-Amz-Signature=ec10e09da1aab0223d2a1809e3540ad6e22703289dc6e7bbb512e438b6ce3f4f&X-Amz-SignedHeaders=host&actor_id=78508907&key_id=0&repo_id=50147694&response-content-disposition=attachment%3Bfilename%3Dgateron_ks9_datasheet.pdf&response-content-type=application%2Fpdf)
- [cherry mx datasheet](https://media.digikey.com/PDF/Data%20Sheets/Cherry%20PDFs/MX%20Series.pdf)