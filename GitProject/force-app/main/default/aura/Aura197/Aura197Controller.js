({
    handleSubmit : function(cmp, event, helper) {
       // event.preventDefault();       // stop the form from submitting
       const fields = event.getParam('fields');
       fields.Phone = '04389'; // modify a field
        cmp.find('myRecordForm').submit(fields);
    }
})