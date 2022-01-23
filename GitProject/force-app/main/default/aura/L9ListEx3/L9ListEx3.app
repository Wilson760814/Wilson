<aura:application extends="force:slds">
	<aura:attribute name="countries" type="List" default="['INDIA','AUSTRALIA']"/>
    
    <aura:iteration items="{!v.countries}" var="c">
        {!c} <br/>
    </aura:iteration>
</aura:application>