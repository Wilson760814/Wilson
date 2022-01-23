({
	invoke : function(component, event, helper) {
        // To get the input of First Value using Id "fV"
		var a = component.find("fv").get("v.value");
        console.log(a);
        var b = component.find("sv").get("v.value");
        console.log(b);
        
        var btnId = event.getSource().getLocalId(); // button Id
        var btnName = event.getSource().get("v.name");  // button Name
        
        console.log('btnId '+btnId);
        console.log('btnName '+btnName);
        var res = 0;
        if(btnId == 'btnAdd'){
            res = parseFloat(a) + parseFloat(b);
            component.find("res").set("v.value",res);
           
            console.log( component.find("btnAdd"));
           //  component.find("btnAdd").variant("brand");
        }
        if(btnId == 'btnMul'){
            res = parseFloat(a) * parseFloat(b); 
            component.find("res").set("v.value",res);
            component.find("btnMul").variant("brand");
        }
        if(btnId == 'btnDiv'){
            res = parseFloat(a) / parseFloat(b);
            component.find("res").set("v.value",res);
        }
        if(btnId == 'btnMin'){
            res = parseFloat(a) - parseFloat(b); 
            component.find("res").set("v.value",res);
        }
         if(btnId == 'btnClr'){
           component.find("res").set("v.value",null);
           component.find("fv").set("v.value",null);
           component.find("sv").set("v.value",null);
        }
        console.log(res);
	}
   
})