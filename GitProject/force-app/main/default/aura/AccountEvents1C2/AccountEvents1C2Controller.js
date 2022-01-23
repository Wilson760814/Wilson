({
	getData : function(component, event, helper) {
        var accrec = event.getParam("accRecord");
        component.set("v.accountAcc",accrec);
        component.set("v.flag",true);
	}
})