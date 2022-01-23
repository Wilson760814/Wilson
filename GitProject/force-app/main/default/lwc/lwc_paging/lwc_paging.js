import    {    LightningElement    }    from    'lwc';		
		
   export    default    class    lwc_paging    extends    LightningElement    {		
                   /*		
                       *    初期化処理		
                       */		
                   connectedCallback()    {		
                   }		
		
                   /*		
                       *    「前一页」		
                       */		
                   previousHandler()    {		
                                   this.dispatchEvent(new    CustomEvent('previous'));		
                   }		
		
                   /*		
                       *    「下一页」		
                       */		
                   nextHandler()    {		
                                   this.dispatchEvent(new    CustomEvent('next'));		
                   }		
   }