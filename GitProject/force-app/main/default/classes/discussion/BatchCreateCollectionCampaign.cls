/*
*    @Author          : Isidra Cruto
*    @Date Created    : 31 May 2021
*    Description      : CCF-4068 add members to collections case  
*/
public class BatchCreateCollectionCampaign implements Database.batchable<sObject> {
    
    public Database.QueryLocator start(Database.batchableContext bc) {
        String queryString = 'SELECT Id, Contact__c, Case__c, Case__r.CustomerAccount__c, 
        Customer__c, Customer__r.Id, Campaign_Type__c, Event_Type__c, Planned_Date__c, 
        Case_State__c FROM Collection_Event__c 
        WHERE Status__c = \'Scheduled\' AND (Event_Type__c = \'Dialer 1 BH\'  OR 
        Event_Type__c = \'Dialer 2 AH\' OR Event_Type__c = \'Dialer 3 AH\') AND 
        Planned_Date__c <= TODAY';
        return Database.getQueryLocator(queryString);
    }
    
    public void execute(Database.BatchableContext bc, List<Collection_Event__c> ceList){
        Map<Id, Id> accCampTypeMap = new Map<Id, Id>();
        List<Campaign> collCampaignList = [SELECT Id, Name, StartDate, Domain__c, Event_Type__c, 
        State__c, Type FROM Campaign WHERE Domain__c =: 'Collections' AND StartDate = TODAY];
        Map<Id, Campaign> ceCampMap = new Map<Id, Campaign>();
        Map<Id, Collection_Event__c> cePlannedDateMap = new Map<Id, Collection_Event__c>();
        
        for(Collection_Event__c cev : ceList){
            cePlannedDateMap.put(cev.Id, cev);
            accCampTypeMap.put(cev.Customer__r.Id, cev.Id);
            for(Campaign camp : collCampaignList){
                if(camp.Event_Type__c == cev.Event_Type__c && camp.Type == cev.Campaign_Type__c && 
                camp.Event_Type__c != 'Dialer 3 AH'){
                    ceCampMap.put(cev.Id, camp);
                }else if(camp.Event_Type__c == 'Dialer 3 AH' && cev.Event_Type__c == 'Dialer 3 AH' && 
                camp.State__c == 'WA' && cev.Case_State__c == 'WA'){
                    ceCampMap.put(cev.Id, camp);
                }else if(camp.Event_Type__c == 'Dialer 3 AH' && cev.Event_Type__c == 'Dialer 3 AH' && 
                camp.State__c != 'WA' && cev.Case_State__c != 'WA'){
                    ceCampMap.put(cev.Id, camp);
                }
            }
        }
        //create collection event contact map
       	List<Contact> cmContactList = [SELECT Id, ExternalCustomerId__c, FirstName, LastName, Phone, 
           MobilePhone, AccountId, Account.Name, OtherPhone, AccountRoles__c FROM Contact 
           WHERE AccountId IN: accCampTypeMap.keySet() AND Active__c = TRUE];
        
        Map<String, Contact> mapContact = new Map<String, Contact>();
        for(Contact c: cmContactList){
            if(c.Phone != NULL){
                if(mapContact.containsKey(c.Phone) && c.AccountRoles__c == 'Primary'){
                    mapContact.put(c.Phone, c);
                }else if(mapContact.containsKey(c.Phone) && mapContact.get(c.Phone).AccountRoles__c !=
                 NULL && mapContact.get(c.Phone).AccountRoles__c == 'Tertiary'){
                    mapContact.put(c.Phone, c);
                }else if(!mapContact.containsKey(c.Phone)){
                    mapContact.put(c.Phone, c);
                }
            }
            if(c.MobilePhone != NULL){
                if(mapContact.containsKey(c.MobilePhone) && c.AccountRoles__c == 'Primary'){
                    mapContact.put(c.MobilePhone, c);
                }else if(mapContact.containsKey(c.MobilePhone) && mapContact.get(c.MobilePhone)
                .AccountRoles__c != NULL && mapContact.get(c.MobilePhone).AccountRoles__c == 
                'Tertiary'){
                    mapContact.put(c.MobilePhone, c);
                }else if(!mapContact.containsKey(c.MobilePhone)){
                    mapContact.put(c.MobilePhone, c);
                }
            }
            if(c.OtherPhone != NULL){
                if(mapContact.containsKey(c.OtherPhone) && c.AccountRoles__c == 'Primary'){
                    mapContact.put(c.OtherPhone, c);
                }else if(mapContact.containsKey(c.OtherPhone) && mapContact.get(c.OtherPhone).
                AccountRoles__c != NULL && mapContact.get(c.OtherPhone).AccountRoles__c == 'Tertiary')
                {
                    mapContact.put(c.OtherPhone, c);
                }else if(!mapContact.containsKey(c.OtherPhone)){
                    mapContact.put(c.OtherPhone, c);
                }
            }
        }
        
        Map<Id, List<Contact>> ceConMap = new Map<Id, List<Contact>>();
        if(accCampTypeMap != null && !accCampTypeMap.isEmpty()){
            if(mapContact != NULL && !mapContact.isEmpty()){
                for(Contact con : mapContact.values()){
                    if(accCampTypeMap.containsKey(con.AccountId)){
                        if(ceConMap.containsKey(accCampTypeMap.get(con.AccountId))){
                            ceConMap.get(accCampTypeMap.get(con.AccountId)).add(con);
                        }else{
                            ceConMap.put(accCampTypeMap.get(con.AccountId), new List<Contact>{con});
                        }                
                    }
                }  
            }
        }
        //create campaign member here
        List<CampaignMember> results = new List<CampaignMember>();
        List<Campaign> updateCampaignStatus = new List<Campaign>();
        for(Id ce : ceConMap.keySet()){
            for(Contact c : ceConMap.get(ce)){
                if(ceCampMap.get(ce)!=null){
                    CampaignMember newCM = new CampaignMember();
                    newCM.Type__c = 'Contact';
                    newCM.ContactId = c.Id; //populates FirstName, LastName, and Phone automatically
                    newCM.Status = 'Sent';
                    newCM.Campaign_Name__c = ceCampMap.get(ce).Name;
                    newCM.Customer_Number__c = c.ExternalCustomerId__c;
                    newCM.Mobile_Number__c = c.MobilePhone != NULL ? c.MobilePhone : NULL; 
                    
                    if(c.Phone != NULL && (c.MobilePhone == NULL || (c.MobilePhone != NULL && c.Phone !=
                     c.MobilePhone))) {
                        newCM.Phone_Genesys__c = c.Phone;
                    }
                    if(c.OtherPhone != NULL && (c.Phone == NULL || (c.Phone != NULL && c.OtherPhone 
                    != c.Phone)) && (c.MobilePhone == NULL || (c.MobilePhone != NULL && c.OtherPhone != c.MobilePhone))) {
                        newCM.Other_Phone__c = c.OtherPhone;
                    }
                    
                    //populate sortorder with planned date
                    DateTime dt = DateTime.newInstance(cePlannedDateMap.get(ce).Planned_Date__c.year(), cePlannedDateMap.get(ce).Planned_Date__c.month(),cePlannedDateMap.get(ce).Planned_Date__c.day());
                    newCM.purecloud__Sort_Order__c = dt.format('yyyyMMdd');//cePlannedDateMap.get(ce).format('yyyy-MM-dd');
                    newCM.CampaignId = ceCampMap.get(ce).Id;
                    newCM.Case_ID__c = cePlannedDateMap.get(ce).Case__c;
                    results.add(newCM);
                    if(!updateCampaignStatus.contains(ceCampMap.get(ce))){
                        updateCampaignStatus.add(ceCampMap.get(ce));
                    }
                }
            }
        }
        //Set Campaign Status to Completed
        List<Campaign> updateCampaignStatusList = new List<Campaign>();
        if(updateCampaignStatus != NULL && !updateCampaignStatus.isEmpty()){
            for(Campaign c: updateCampaignStatus){
                Campaign cmp = new Campaign();
                cmp.Status = 'Monitoring';
                cmp.Id = c.Id;
                updateCampaignStatusList.add(cmp);                
            }
        }
        
        if(results != NULL && !results.isEmpty()){
        	database.insert(results, false);
        }
        if(updateCampaignStatusList != NULL && !updateCampaignStatusList.isEmpty()){
        	database.update(updateCampaignStatusList, false);
        }
    }    
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}