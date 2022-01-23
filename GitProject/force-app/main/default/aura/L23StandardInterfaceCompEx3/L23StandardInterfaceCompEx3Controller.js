({
	invoke : function(component, event, helper) {
		var sobjName = component.get("v.sObjectName");
        console.log('object name ->'+sobjName); 
        var cols = [
            {label:"Name",fieldName:"Name",type:"text"}
        ];
        component.set("v.myColumns",cols);
        
        
        var action = component.get("c.get10Records");
        action.setParams({"objName":sobjName});
        action.setCallback(this,function(response){
           var state = response.getState(); 
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                if(res != ''){
                    component.set("v.lstData",res); 
                }
            }
        });
        $A.enqueueAction(action);
        
	}
})