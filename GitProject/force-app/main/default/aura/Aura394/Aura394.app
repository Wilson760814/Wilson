<aura:application extends="force:slds" controller="Aura394Class">
    <aura:attribute name="lstAccounts" type="List"/>
  
    <aura:attribute name="accountcolumns" type="List"/>
 
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
       
    </lightning:layout>
    
</aura:application>