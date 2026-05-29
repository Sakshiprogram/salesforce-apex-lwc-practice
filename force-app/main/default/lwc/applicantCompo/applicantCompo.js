import { LightningElement } from 'lwc';
import searchAddress from '@salesforce/apex/ApplicantProvider.searchAddress';
export default class ApplicantCompo extends LightningElement {


appObj ={'sObjectType':'Applicant__c'}
adr;

dataHandler(){
this.appObj.Name= this.template.querySelector('lightning-input[data-formfield="App"]').value;

searchAddress({objApp:this.appObj})
.then(result=>{
  this.adr=result;
})
.catch(error=>{

})
}


}