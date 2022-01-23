<aura:application extends="force:slds" controller="LayoutClass">
    <aura:attribute name="lstAccounts" type="List"/>
    <aura:attribute name="lstContacts" type="List"/>
    <aura:attribute name="accountcolumns" type="List"/>
    <aura:attribute name="contactcolumns" type="List" />
    <aura:handler name="init" value="{!this}" action="{!c.doinit}"/>
     
    <lightning:layout multipleRows="true">
        <lightning:layoutItem size="4">
            
            <div style="width:500px;margin-left:50px;margin-top:100px;border:1px solid green;">
                <lightning:card title="Accounts" iconName="standard:account">
                    <lightning:datatable
                                         keyField="id"
                                         data="{! v.lstAccounts }"
                                         columns="{! v.accountcolumns }"
                                         hideCheckboxColumn="false"/>
                </lightning:card>
            </div>
            
            
        </lightning:layoutItem>
        <lightning:layoutItem size="4">
            
            <div style="width:500px;margin-left:100px;margin-top:100px;border:1px solid green;">
                <lightning:card title="Contacts" iconName="standard:contact">
                    <lightning:datatable
                                         keyField="id"
                                         data="{! v.lstContacts }"
                                         columns="{! v.contactcolumns }"
                                         hideCheckboxColumn="false"/> 
                </lightning:card>
            </div>
            
        </lightning:layoutItem>
    </lightning:layout>
    
</aura:application>