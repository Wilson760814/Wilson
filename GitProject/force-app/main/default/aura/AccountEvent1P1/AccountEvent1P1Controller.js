({
	displayAccounts : function(component, event, helper) { 
		var cols = [
            {label:'Account Name',fieldName:'Name',type:'text'},
            {label:'Account Phone',fieldName:'Phone',type:'text'},
            {label:'Account Industry',fieldName:'Industry',type:'text'}
        ];
        component.set("v.myColumns",cols); 
        var skey = event.getParam("searchKey");
        var action=component.get("c.getAccounts");
        action.setParams({"searchparam":skey});
        action.setCallback(this,function(response){
           	var state = response.getState();
            if(state == 'SUCCESS'){
                var res = response.getReturnValue();
                component.set("v.lstAccounts",res);
                component.set("v.flag",true);
            }
        });
        $A.enqueueAction(action);
	}
})