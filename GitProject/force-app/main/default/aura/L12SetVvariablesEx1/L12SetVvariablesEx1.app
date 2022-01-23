<aura:application extends="force:slds">
    <aura:attribute name="Ages" type="integer[]" default="[30,40,50,60,70]"/>
    <aura:attribute name="Countries" type="List" default="['INDIA','INDIA','AUSTRALIA','DUBAI','UK','US']"/>
    <aura:attribute name="Cities" type="set" default="['Hyderabad','Sydney','Hyderabad','Chennai','Delhi']"/>
    
    <div style="margin-left:100px;margin-top:100px;width:100px;border:1px solid green;">
    	<aura:iteration items="{!v.Ages}" var="age">
            <p>{!age}</p>
        </aura:iteration> 
    </div>
    
	<div style="margin-left:100px;margin-top:20px;width:150px;border:1px solid black;">
    	<aura:iteration items="{!v.Countries}" var="c">
            <p>{!c}</p>
        </aura:iteration> 
    </div>    
    
    <div style="margin-left:100px;margin-top:20px;width:150px;border:1px solid black;">
    	<aura:iteration items="{!v.Cities}" var="c">
            <p>{!c}</p>
        </aura:iteration> 
    </div> 
    
</aura:application>