({
	invoke : function(component, event, helper) {
		var btnId = event.getSource().getLocalId();
        var a = component.find("fv").get("v.value");
        var b = component.find("sv").get("v.value");
        var res = 0;
       
        if(btnId =='addbtn'){
            res = parseInt(a) + parseInt(b);
              console.log("resadd: "+res);
            component.set("v.res",res);
        }
        if(btnId === 'mulbtn'){
			res = parseInt(a) * parseInt(b);
            console.log("resmul: "+res);
            component.set("v.res",res);            
        }
        
        if(btnId == 'refreshbtn'){
            component.find("fv").set("v.value",null);
            component.find("sv").set("v.value",null);
            component.set("v.flag1",false);
            res=null;
            console.log("Flag= " + component.get("v.flag1"));            
            var m =  component.get("v.vfv");
             console.log("m: "+m);
             console.log("n: "+component.get("v.vsv"));
            console.log("res: "+res);
        }
        if(Number.isInteger(res)){
             console.log("123");
            component.set("v.flag1",true);
            
        }
	}
})