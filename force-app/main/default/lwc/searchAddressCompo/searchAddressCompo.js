import { LightningElement } from 'lwc';
import searchAddress from '@salesforce/apex/ApplicantProvider.searchAddress';
export default class SearchAddressCompo extends LightningElement {

       columns= [
        {label: 'Country', fieldName: 'Country__c', editable:true},
        {label: 'City', fieldName: 'City__c', editable:true},
        {label: 'State', fieldName: 'State__c', editable:true}
       
    ];
    appList;

 objApp= {'sObjectType':'Applicant__c'}

    searchHandler(){

       this.objApp.Name= this.template.querySelector('lightning-input[data-formfield="App"]').value;
        
       searchAddress({objApp:this.objApp})
          .then(result=>{
             console.log(JSON.stringify(result));
             this.appList=result;
          })
          .catch(error=>{
            console.log(JSON.stringify(error));
            this.appList=[];
          })
        }

}