<aura:application extends="force:slds" controller="CustomersData">
    <aura:attribute name="lstAccounts" type="List" />
    <aura:attribute name="flag" type="boolean" default="false" />
    
    <div class="btnCss">
    	<lightning:button label="Show Customers" onclick="{!c.showData}"/>
    </div>
    
    <aura:if isTrue="{!v.flag}">
    	<div style="width:500px;margin-left:100px;margin-top:100px;">
    	<table style="border:1px solid black;">
        	<tr style="border:1px solid green;">
            	<td>
                	<b>Name</b>
                </td>
                <td>
                	<b>Phone</b>
                </td>
                <td>
                	<b>Industry</b>
                </td>
            </tr>
            <aura:iteration items="{!v.lstAccounts}" var="acc">
            	<tr>
                	<td>
                        	{!acc.Name}
                    </td>
                    <td>
                        	{!acc.Phone}
                    </td>
                    <td>
                        	{!acc.Industry}
                    </td>
                </tr>
            </aura:iteration>
        </table>
    </div>
    </aura:if>
    
    
</aura:application>