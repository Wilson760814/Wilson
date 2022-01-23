({
	searchData : function(component, event, helper) {
		var spinner = component.find("mySpinner"); 
        $A.util.removeClass(spinner, "slds-hide");
        var key = component.get("v.strKey");
        var action = component.get("c.SearchAccount"); 
        action.setParams({"strIndustry":key});
        action.setCallback(this,function(response){
           	var state = response.getState();
         
            if(state == 'SUCCESS'){
                var result = response.getReturnValue();
                
               
                component.set("v.accountRecord",result);
                component.set("v.flag",true);
                  $A.util.addClass(spinner, "slds-hide");
               
            }else{
                var result = response.getReturnValue();
                alert(result.status);
            }
        });
        $A.enqueueAction(action);
	}
})