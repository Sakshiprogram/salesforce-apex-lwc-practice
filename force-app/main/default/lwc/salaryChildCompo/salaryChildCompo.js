import { LightningElement } from 'lwc';

export default class SalaryChildCompo extends LightningElement {
data='Hello LNCT';
sendDataHandler(){

    const myEvent = new CustomEvent("childdata", {
        detail: this.data
    });
    this.dispatchEvent(myEvent);
}


}