import { LightningElement } from 'lwc';

export default class ModelCompo extends LightningElement {
    name;

    sendHandler(){
     this.name= this.template.querySelector('lightning-input[data-formfield="Acc"]').value;
    }

    clearHandler(){
       this.name=null;
    }
}