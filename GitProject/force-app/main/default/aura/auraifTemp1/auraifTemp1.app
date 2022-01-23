<aura:application >
	<aura:attribute name="edit" type="Boolean" default="false"/>
<aura:if isTrue="{!v.edit}">
    <lightning:button label="Edit"/>
    <aura:set attribute="else">
        You can’t edit this.
    </aura:set>
</aura:if>

</aura:application>