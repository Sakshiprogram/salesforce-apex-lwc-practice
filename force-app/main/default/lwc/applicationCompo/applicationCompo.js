import { LightningElement } from 'lwc';
import createNewApplicant from '@salesforce/apex/ApplicantProvider.createNewApplicant';
export default class ApplicationCompo extends LightningElement {
objApp= {'sObjectType':'Applicant__c'}

 get selectOption(){
    return[
        {label: 'Male',value:'Male'},
        {label: 'Female',value:'Female'},
        {label: 'Other',value:'Other'}, 
    ];
 }

dataHandler(event){
    this.objApp.Gender__c=event.detail.value;
}
applicantHandler(){

    this.objApp.First_Name__c=this.template.querySelector('lightning-input[data-formfield="firstName"]').value;
    this.objApp.Last_Name__c=this.template.querySelector('lightning-input[data-formfield="lastName"]').value;
    this.objApp.DOB__c=this.template.querySelector('lightning-input[data-formfield="dob"]').value;
    this.objApp.Email_id__c=this.template.querySelector('lightning-input[data-formfield="email"]').value;

 createNewApplicant({objApp:this.objApp})
 .then(result=>{
    console.log('data saved');
 })
.catch(error=>{
    console.log('something went wrong');
    console.log(error);
});
}
}