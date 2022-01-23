public with sharing class MyControllerExtension {

    public MyControllerExtension(ApexPages.StandardController controller) {

    }

    private ApexPages.StandardSetController setController;

    public MyControllerExtension(ApexPages.StandardSetController setController) {
        this.setController = setController;
        
        Account [] records = [SELECT Id, Name FROM Account LIMIT 30];
        setController.setSelected(records);
    }
}