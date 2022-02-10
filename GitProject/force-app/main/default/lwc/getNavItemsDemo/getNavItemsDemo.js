import { LightningElement, wire } from 'lwc';
import {getNavItems} from 'lightning/uiAppsApi'
export default class GetNavItemsDemo extends LightningElement {
    result
    @wire(getNavItems, {
        navItemNames:['standard-Account'],
        pageSize:30
    })
    navItemsHandler({data}){
        if(data){
            console.log("12345");
            console.log(JSON.stringify(data));
            console.log(data.navItems);
            console.log(data.navItems[0]);
            console.log("7890J");
            this.result = data.navItems[0]
        }
    }
}