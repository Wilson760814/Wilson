<aura:application extends="force:slds">
	 <aura:attribute name="variable1" type="boolean" default="true"/>	
    <aura:attribute name="variable2" type="boolean" default="false"/>	
    <aura:attribute name="variable3" type="boolean" default="true"/>	
    <aura:attribute name="variable4" type="boolean" default="false"/>	
    <aura:if isTrue="{!v.variable1}">
        <div style="background: #FF0000">
            This should be displayed as variable1 is true
        </div>
    </aura:if>
     <aura:if isTrue="{!or(v.variable1, v.variable2)}">
        <div style="background-color:LightBlue">
            This should be displayed as variable1 or variable2 is true
        </div>
    </aura:if>
    

</aura:application>