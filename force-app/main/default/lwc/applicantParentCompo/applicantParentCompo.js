import { LightningElement } from 'lwc';
import searchAddress from '@salesforce/apex/ApplicantProvider.searchAddress';
export default class ApplicantParentCompo extends LightningElement {
showPopup =false;

appList;
 objApp= {'sObjectType':'Applicant__c'}


    searchHandler(){
           console.log('Button clicked');
        this.objApp.Name= this.template.querySelector('lightning-input[data-formfield="App"]').value;
        this.showPopup=true;
       
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

        parentMethod(event){
          this.showPopup=event.detail;
        }
    
        
}