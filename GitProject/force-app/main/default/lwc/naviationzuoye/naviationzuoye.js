import { LightningElement, api } from 'lwc';
import {NavigationMixin} from 'lightning/navigation'
export default class Naviationzuoye extends NavigationMixin (LightningElement) {
    @api recordId;
    navigateAccRecentView(){
        this[NavigationMixin.Navigate]({
            "type":"standard__objectPage",
            "attributes":{
                "objectApiName":"Account",
                "actionName":"list"
            },
            "state":{
                "filterName":"All"
            }
        });
     }
}