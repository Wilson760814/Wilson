import { LightningElement , track} from 'lwc';

export default class PageParentzuoye extends LightningElement {
@track msg=1;
   
handleCustomEvent(event)
{
    this.msg=event.detail;
}
}