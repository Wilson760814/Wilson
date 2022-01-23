import { LightningElement, track } from 'lwc';

export default class PageChildzuoye extends LightningElement {
    @track name=1;
    
    houyiyehandleChange(event){
       
        this.name=this.name+1;
        const selectEvent=new CustomEvent('mycustomevent',{detail:this.name});
        this.dispatchEvent(selectEvent);
     }

     qianyiyehandleChange(event){            
         if(this.name>1)
            {
                this.name=this.name-1;
                const selectEvent=new CustomEvent('mycustomevent',{detail:this.name});
                this.dispatchEvent(selectEvent);
            }
     }
}