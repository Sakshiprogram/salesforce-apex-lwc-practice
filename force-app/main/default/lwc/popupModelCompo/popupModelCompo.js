import { LightningElement,api } from 'lwc';

export default class PopupModelCompo extends LightningElement {

    @api data;

    closeDataHandler(){
        const myEvent= new CustomEvent("childdata",{
            detail:false
        });
        this.dispatchEvent(myEvent);
    }
}