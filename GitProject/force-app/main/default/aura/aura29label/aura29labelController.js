({
    newCaseAction : function(component, event, helper) {
        var homePageNewslabel = $A.get("$Label.c.HomePageWS");
        component.set('v.homePageNews', homePageNewslabel);
    }
})