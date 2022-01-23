<aura:application extends="force:slds">
    <aura:attribute name="res" type="Integer" />
    <aura:attribute name="flag1" type="boolean" default="false"/>
    <aura:attribute name="vfv" type="Integer" />
    <aura:attribute name="vsv" type="Integer" />
    <div class="details">
        <lightning:card  iconName="standard:account" >
            <aura:set attribute="title">
                <h1>Arithmetic Operations</h1>
            </aura:set> 
            <aura:set attribute="actions">
                <lightning:button label="Add" onclick="{!c.invoke}" aura:id="addbtn"/>
                <lightning:button label="Mul" onclick="{!c.invoke}" aura:id="mulbtn"/>
                <lightning:button label="Refresh" onclick="{!c.invoke}" aura:id="refreshbtn"/>
            </aura:set>
            <div class="input1">
                <lightning:input label="First Value" aura:id="fv" value="{!v.vfv}"/>
                <lightning:input label="Second Value" aura:id="sv" value="{!v.vsv}"/>
            </div>
            <aura:if isTrue="{!v.flag1}">
            	 Result : {!v.res}
            </aura:if>
        </lightning:card>
   </div>
</aura:application>