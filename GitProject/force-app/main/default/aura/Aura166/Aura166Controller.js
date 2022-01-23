({
	invoke : function(component, event, helper) {
		var accRecordId = component.get("v.recordId"); // Returns id of the record.
          component.set("v.AccId", accRecordId);}
})