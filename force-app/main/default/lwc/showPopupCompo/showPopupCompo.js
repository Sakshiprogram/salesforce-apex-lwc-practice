import { LightningElement } from 'lwc';

export default class ShowPopupCompo extends LightningElement {
    
    showPopup=false;
    name='class-123';

    showPopupHandler(){
        this.showPopup=true;
    }

    parentMethod(event){
        
        this.showPopup=event.detail;
    }
}