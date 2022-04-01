// old case without curve on the top
// this uses the svgs provided by EOD directly without much modification.
//translate([0,0,50])rotate([180,0,0])
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
