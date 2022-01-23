({
	add1 : function(component, event, helper) {
		var a = component.get("v.first");
        var b = component.get("v.second");
        var result = (a+b);
        component.set("v.addd",result);
        console.log(a);
        console.log(b);
        console.log(result);
	},
    mul1 : function(component, event, helper){
        var a = component.get("v.first");
        var b = component.get("v.second");
        var result = (a*b);
        component.set("v.mull",result);
        console.log(a);
        console.log(b);
        console.log(result);
    }
})