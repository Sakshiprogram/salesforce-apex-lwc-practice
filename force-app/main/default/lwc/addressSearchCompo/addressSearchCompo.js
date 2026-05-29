import { LightningElement } from 'lwc';
import searchAddress from '@salesforce/apex/ApplicantProvider.searchAddress';
export default class ApplicantIdCompo extends LightningElement {

    objApp= {'sObjectType':'Applicant__c'}

    searchHandler(){

       this.objApp.Name= this.template.querySelector('lightning-input[data-formfield="App"]').value;
        
       searchAddress({objApp:this.objApp})
          .then(result=>{
             console.log(JSON.stringify(result));
          })
          .catch(error=>{
            console.log(JSON.stringify(error));
          })
    }
}