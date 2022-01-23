({
	searchData : function(component, event, helper) {
		var key = component.get("v.strKey");
        var action = component.get("c.SearchAccount"); 
        action.setParams({"strIndustry":key});
        action.setCallback(this,function(response){
           	var state = response.getState();
            console.log(state);
            if(state == 'SUCCESS'){
                var result = response.getReturnValue();
                component.set("v.accountRecord",result);
                component.set("v.flag",true);
                alert(result.status);
            }else{
                var result = response.getReturnValue();
                alert(result.status);
            }
        });
        $A.enqueueAction(action);
	}
})