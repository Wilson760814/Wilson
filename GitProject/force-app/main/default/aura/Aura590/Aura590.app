<aura:application extends="force:slds" controller="Aura590Class">
    <aura:attribute name="lstAccounts" type="List"/>
  
    <aura:attribute name="accountcolumns" type="List"/>
 
    <aura:handler name="init" value="{!this}" action="{!c.doinit}"/>
     
    <aura:attribute name="flag" type="boolean" default="false"/>
    
    <div style="margin-left:100px;margin-top:50px;height:100px;width:500px;">
       <lightning:button label="Search" onclick="{!c.searchData}"/>
    </div> 
    
    <aura:if isTrue="{!v.flag}"> 
    
    <lightning:layout multipleRows="true">
        <lightning:layoutItem size="5">
            
            <div style="width:1200px;margin-left:50px;margin-top:20px;border:1px solid green;">
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
  </aura:if>
    
</aura:application>