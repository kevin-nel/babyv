module switchplate(outer_scale){
    union(){
        difference(){
            linear_extrude(1)offset(delta=outer_scale)import(file="svgs/SwitchPlate.svg",center = false);
            translate([0,100+outer_scale,-1])linear_extrude(3)offset(delta=outer_scale)import(file="svgs/SwitchPlate.svg",center = false);
        }
    }
}


module case_inner(){
    difference(){
    union(){
        difference(){
            scale([1,1,10])switchplate(6);
            linear_extrude(10)offset(delta=2)import(file="svgs/Top.svg",center = false);        
            translate([4,4,0])scale([0.97,0.92,5])switchplate(6);
        }
        translate([0,0,5])
        difference(){
            scale([1,1,20])switchplate(6);     
            translate([4,4,0])scale([0.97,0.92,21])switchplate(6);  
        }
        //promicro mount
        difference(){
            translate([132-13/2,95,13])cube([21.5,5,8]);
            translate([132-9/2,85-33/2,18-1.5])cube([18,33,1.5]);
        }
        difference(){
            translate([0,0,5])linear_extrude(20)offset(delta=3)import(file="svgs/ScrewHoles.svg",center = false);
            translate([0,0,15])linear_extrude(10)offset(delta=0)import(file="svgs/ScrewHoles.svg",center = false);
            translate([0,100+6,-1])linear_extrude(50)offset(delta=6)import(file="svgs/SwitchPlate.svg",center = false);    } 
    }
    translate([132,90,8+5])cube([8,18,8]);//usb hole
    }
}
module plate(){
    union(){
        
        difference(){
            //plate
            translate([4,4,0])scale([0.97,0.92,5])switchplate(6);
            //holes
            union(){
                translate([4+0.68+0.05-0.0450000000,5,0])linear_extrude(5)import(file="svgs/SwitchHolesUpdated.svg",center = false);
                translate([4+0.68+0.05-0.0450000000,5,1.5])linear_extrude(5-1.5)offset(delta=1.4)import(file="svgs/SwitchHolesUpdated.svg",center = false);
            }
            rotate([0,0,-8])translate([19*4+5+1,23+3-.5,1.5])cube([19*2-2,19.5,5]);
            rotate([0,0,8])translate([19*8-2+1,-11-1-.5,1.5])cube([19*2-2,19.5,5]);
        }
    }
}
module case_top(){
    union(){
        translate([272,0,0])
        rotate([180,0,180])
        difference(){
            difference(){
                translate([-4,-4,0])scale([1.03,1.07,25])switchplate(6);
                translate([0,0,0])scale([1,1,20])switchplate(6);
                //translate([-1,-1,0])scale([1.01,1.01,20])switchplate(6); //more tolerance
                translate([0,0,20])linear_extrude(5)import(file="svgs/Top.svg",center = false); 
            }
            rotate([6,0,0])translate([-20,-20,-29.2])cube([315,150,30]);
        }
    }
}

module bottom(){
difference(){
    scale([1,1,5])switchplate(6);
    translate([0,0,-2.5])linear_extrude(10)offset(delta=0)import(file="svgs/ScrewHoles.svg",center = false);     
}
}
//top
translate([7.5,114.5,45])rotate([180,0,0])
union(){
    translate([0,0,-5])case_top();

    //one piece case and plate
    union(){
        //switchplate
        translate([0,0,0])plate();
        //case inner
        translate([0,0,0])case_inner();
    }
    
    //bottom plate
    translate([0,0,40])bottom();
}
