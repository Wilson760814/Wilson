({
	doSave : function(component, event, helper) {
		var accountRecord = component.get("v.acc");
        var action = component.get("c.insertAccount");
        action.setParams({"objA":accountRecord});
        action.setCallback(this,function(response){
           var state = response.getState();
            
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                if(res != 'error'){
                    // fire an event.
                 console.log("111") ; 
                    var evt = component.getEvent("first");
                     evt.setParams({"flag":true});
                    console.log("222flag-save: "+'flag') ; 
                    evt.fire();
                }
            }
        });
        $A.enqueueAction(action);
	},
    doCancel : function(component, event, helper){
       var acc;
       component.set("v.acc", acc);  
        console.log("333") ; 
       var evt = component.getEvent("first");
       evt.setParams({"flag":false});
       var btnflag = event.getParam("flag");
        component.set("v.flag1",btnflag); 
        console.log(component.get("v.flag1"));
        console.log("444") ;
       evt.fire();
              
    }
})

/*
({
	doSave : function(component, event, helper) {
		var accountRecord = component.get("v.acc");
        var action = component.get("c.insertAccount");
        action.setParams({"objA":accountRecord});
        action.setCallback(this,function(response){
           var state = response.getState();
            
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                if(res != 'error'){
                    // fire an event.
                 console.log("111") ; 
                    var evt = component.getEvent("first");
                     
                    evt.fire();
                }
            }
        });
        $A.enqueueAction(action);
	},
    doCancel : function(component, event, helper){
       var acc;
console.log('acc->>'+acc);
component.set("v.acc",acc);
var evt = component.getEvent("first");
evt.setParams({"flag":false});
evt.fire();
    }
})


({
doSave : function(component, event, helper) {
var accountRecord = component.get("v.acc");
var action = component.get("c.insertAccount");
action.setParams({"objA":accountRecord});
action.setCallback(this,function(response){
var state = response.getState();
if(state == 'SUCCESS'){
var res = response.getReturnValue();
if(res != 'error'){
// fire an event.
var evt = component.getEvent("first");
evt.setParams({"flag":true});
evt.fire();
}
}
});
$A.enqueueAction(action);
},
doCancel : function(component, event, helper){
var acc;
console.log('acc->>'+acc);
component.set("v.acc",acc);
var evt = component.getEvent("first");
evt.setParams({"flag":false});
evt.fire();
}
})

*/