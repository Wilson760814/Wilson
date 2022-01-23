<aura:application extends="force:slds">
    <aura:attribute name="accountRecord" type="Account" default="{
                                                                  'sobjectType':'Account',
                                                                 	Name:'Nara V',
                                                                 	Phone:'9705898616',
                                                                    Industry :'software'
                                                                 }"/>
    
    <lightning:button label="Invoke" onclick="{!c.showData}"/>
</aura:application>