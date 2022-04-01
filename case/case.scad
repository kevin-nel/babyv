module switchplate(outer_scale){
    union(){
        difference(){
            linear_extrude(1)offset(delta=outer_scale)import(file="svgs/SwitchPlate.svg",center = false);
            translate([0,100+outer_scale,-1])linear_extrude(3)offset(delta=outer_scale)import(file="svgs/SwitchPlate.svg",center = false);
        }
    }
}


module case_inner(){
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
    }
}
module plate(){
    union(){
        
        difference(){
            //plate
            translate([4,4,0])scale([0.97,0.92,5])switchplate(6);
            //holes
            union(){
                //linear_extrude(5)import(file="SwitchHoles.svg",center = false);
                //translate([11-0.95-0.035,11,0])linear_extrude(5)import(file="keyboard5.svg",center = false);
                //translate([11-0.95-0.035,11,1.6])linear_extrude(5-1.6)offset(delta=2)import(file="keyboard5.svg",center = false);
                translate([4+0.68+0.05-0.0450000000,5,0])linear_extrude(5)import(file="svgs/SwitchHolesUpdated.svg",center = false);
                translate([4+0.68+0.05-0.0450000000,5,1.6])linear_extrude(5-1.6)offset(delta=1.4)import(file="svgs/SwitchHolesUpdated.svg",center = false);
            }
            #rotate([0,0,-8])translate([19*4+5+1,23+3+1,1.6])cube([19*2-2,18,5]);
            #rotate([0,0,8])translate([19*8-2+1,-11,1.6])cube([19*2-2,18,5]);
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

//top
translate([0,0,-5])case_top();
//bottom plate
translate([0,0,40])scale([1,1,5])switchplate(6);
//switchplate
!translate([0,0,0])plate();
//case inner
translate([0,0,10])case_inner();


//old case without rounding on the top
//translate([0,0,50])rotate([180,0,0])
/*
union(){

//case bottom
    union(){
        //supports
        difference(){
            linear_extrude(10)offset(delta=6)import(file="SwitchPlate.svg",center = false);
            linear_extrude(10)offset(delta=2)import(file="Top.svg",center = false);
            linear_extrude(5)offset(delta=4)import(file="SwitchPlate.svg",center = false);
        }
        translate([0,0,5])
        difference(){
                linear_extrude(20)offset(delta=6)import(file="SwitchPlate.svg",center = false);
                linear_extrude(21)offset(delta=-2)import(file="SwitchPlate.svg",center = false);     
        }
    }


//switch plate        
    translate([0,0,-20])difference(){
        //plate
        linear_extrude(5)offset(delta=4)import(file="SwitchPlate.svg",center = false);
        //holes
        union(){
            linear_extrude(5)import(file="SwitchHoles.svg",center = false);
            translate([0,0,1.6])linear_extrude(5-1.6)offset(delta=2.2)import(file="SwitchHoles.svg",center = false);
        }
    }
    

//case top
    translate([0,0,-50])
    difference(){
        union(){
            difference(){
                translate([0,0,-5])linear_extrude(5)offset(delta=10)import(file="SwitchPlate.svg",center = false);
                translate([0,0,-5])linear_extrude(5)import(file="Top.svg",center = false);
            }
            difference(){
                translate([0,0,0])linear_extrude(25)offset(delta=10)import(file="SwitchPlate.svg",center = false);
                translate([0,0,0])linear_extrude(25)offset(delta=6)import(file="SwitchPlate.svg",center = false);
            }
        }
        rotate([-6,0,0])translate([0,0,20])linear_extrude(25)offset(delta=20)import(file="SwitchPlate.svg",center = false);
    }
}
*/
