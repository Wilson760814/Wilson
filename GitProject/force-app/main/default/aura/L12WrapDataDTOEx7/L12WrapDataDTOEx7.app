<aura:application extends="force:slds" controller="LayoutClass3">
    <aura:attribute name="Data" type="List"/>
    <aura:attribute name="columns1" type="List"/>
    <aura:attribute name="columns2" type="List"/>
    <aura:handler name="init" value="{!this}" action="{!c.doinit}"/>
     
    <lightning:layout multipleRows="true">
        <lightning:layoutItem size="4">
            
            <div style="width:500px;margin-left:50px;margin-top:100px;border:1px solid green;">
                <lightning:card title="Accounts" iconName="standard:account">
                    <lightning:datatable
                                         keyField="id"
                                         data="{! v.Data }"
                                         columns="{! v.columns1 }"
                                         hideCheckboxColumn="false"/>
                </lightning:card>
            </div>
            
            
        </lightning:layoutItem>
        <lightning:layoutItem size="4">
            
            <div style="width:500px;margin-left:100px;margin-top:100px;border:1px solid green;">
                <lightning:card title="Contacts" iconName="standard:contact">
                    <lightning:datatable
                                         keyField="id"
                                         data="{! v.Data }"
                                         columns="{! v.columns2 }"
                                         hideCheckboxColumn="false"/> 
                </lightning:card> 
            </div>
            
        </lightning:layoutItem>
    </lightning:layout>
    
</aura:application>