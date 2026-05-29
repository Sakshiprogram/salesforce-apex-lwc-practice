import { LightningElement } from 'lwc';

export default class ApplicationFormCompo extends LightningElement {
    name;
    dob;
    email;

    showApplicantRecord(){
        
    this.name = this.template.querySelector('lightning-input[data-formfield="name"]').value;
    this.dob = this.template.querySelector('lightning-input[data-formfield="dob"]').value;
    this.email = this.template.querySelector('lightning-input[data-formfield="email"]').value;

    console.log('data='+ this.name);
    console.log('data='+ this.dob);
    console.log('data='+ this.email);
    }
}