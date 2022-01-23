({
	showData : function(component, event, helper) {
        var cols = [
            {label: 'Account name', fieldName: 'Name', type: 'text'},
            {label: 'Account Phone', fieldName: 'Phone', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
        ];
        component.set("v.columns",cols);
        
		var action = component.get("c.getAccounts");
        action.setCallback(this,function(response){
           var state = response.getState();
            if(state === 'SUCCESS'){
                var result = response.getReturnValue();
                component.set("v.lstAccounts",result);
                component.set("v.flag",true);
            }
        });
        $A.enqueueAction(action);
	}
})