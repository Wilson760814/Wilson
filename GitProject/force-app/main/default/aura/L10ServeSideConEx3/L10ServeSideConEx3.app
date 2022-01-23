<aura:application extends="force:slds" controller="CustomerDetails1">
    <!-- Attributes to store the results -->
    <aura:attribute name="strKey" type="string"/>  
    <aura:attribute name="accRecord" type="Account" default="{'sObjectType':'Account'}"/>
    <aura:attribute name="flag" type="boolean" default="false"/>
    
    <!-- Section for entering Industry for Search -->
    <div style="margin-left:100px;margin-top:100px;width:400px; border:2px">
        <lightning:input label="Industry" value="{!v.strKey}"/> <br/>
        <lightning:button label="Search" onclick="{!c.doSearch}"/>    
    </div>
     
    <!-- Customer Details Section -->
    <div style="height:300px;width:300px;margin-left:100px;margin-top:50px;">
    	<aura:if isTrue="{!v.flag}"> 
            <lightning:card title="Customer Details" iconName="standard:account">
                <div style="padding:5px;">
                    <b>Name</b>			:	{!v.accRecord.Name} <br/>
                    <b>Phone</b>		:	{!v.accRecord.Phone} <br/>
                    <b>Industry</b>		:	{!v.accRecord.Industry} <br/>
                </div> 
            </lightning:card>
        </aura:if>
    </div>
    
</aura:application>