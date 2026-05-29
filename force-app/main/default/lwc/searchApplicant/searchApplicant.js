import { LightningElement } from 'lwc';
import searchApplicant from '@salesforce/apex/ApplicantProvider.searchApplicant';
export default class SearchApplicant extends LightningElement {

objApp = {'sObjectType':'Applicant__c'}
 
searchApplicantHandler(){
    console.log('you are inside js');

     const applicantId = this.template.querySelector('lightning-input[data-formfield="App"]').value;
  
   console.log(applicantId);
   searchApplicant({objApplicant:applicantId})
    .then(result=>{
        this.objApp = result;
        console.log(result);
    })
    .catch(error=>{
        console.log(error);
    });
}
}