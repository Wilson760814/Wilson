<aura:application extends="force:slds" controller="CustomersData1">
    <aura:attribute name="lstAccounts" type="List" />
    <aura:attribute name="columns" type="List" />
    <aura:attribute name="flag" type="boolean" default="false" />
    
    <div class="btnCss">
    	<lightning:button label="Show Customers" onclick="{!c.showData}"/>
    </div>
    
    <aura:if isTrue="{!v.flag}">
    	<div style="width:500px;margin-left:100px;margin-top:100px;border:5px solid red;">
    		<lightning:datatable
                keyField="id"
                data="{! v.lstAccounts }"
                columns="{! v.columns }"
                hideCheckboxColumn="false"/>
    	</div>
    </aura:if>
    
</aura:application>