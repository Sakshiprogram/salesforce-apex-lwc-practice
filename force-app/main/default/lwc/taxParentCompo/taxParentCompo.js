import { LightningElement } from 'lwc';

export default class TaxParentCompo extends LightningElement {
name='waiting for child message';

parentMethod(event){
 this.name=event.detail

}


}