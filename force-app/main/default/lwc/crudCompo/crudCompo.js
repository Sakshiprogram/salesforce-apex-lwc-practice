import { LightningElement } from 'lwc';
import createNewAccount from '@salesforce/apex/AccountProvider.createNewAccount';
import searchAccount from '@salesforce/apex/Accountprovider.searchAccount';
import editAccount from '@salesforce/apex/Accountprovider.editAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent' ; 
import deleteAccount from '@salesforce/apex/Accountprovider.deleteAccount';
export default class CrudCompo extends LightningElement {

 accObj={'sObjectType':'Account'}
 showCreateHandler = false;
 showSearchField= false;
 showSearchHandler=false;
 typeFieldFlag=true;
 slaFieldFlag=true;
 showEditHandler=false;
 

    createAccountHandler(){
          this.showCreateHandler = true;
          this.showSearchHandler=false;
          this.showEditHandler=false;
          
    }

    searchAccountHandler(){
          this.showCreateHandler = false;
          this.showSearchHandler=true;
          this.showEditHandler=false;
          
    }

    editAccountHandler(){
         this.showCreateHandler = false;
         this.showSearchHandler=true;
         this.slaFieldFlag=false;
         this.typeFieldFlag=false;
         this.showEditHandler=true;
         
    }

    deleteAccountHandler(){
          this.showCreateHandler = false;
          this.showSearchHandler=false;
          this.showEditHandler=false;

          if(!this.accObj.Id){
            this.showToast('Error', 'Search Account first','error');
            return;
          }

          deleteAccount({objAccount:this.accObj.Id})
          .then(()=>{
                  this.showToast('Success', 'Account Deleted','warning');
                  this.resetState();
          })
          .catch(error =>{
          this.showToast('Error', error.body.message, 'error');
          });
          
    }

    //Toast message for record saved
    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Saved...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

   //  Toast Message for Search
   showSearchToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Found...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }

   // Toast Message for Edit Record
   showEditToast() {
        const evt = new ShowToastEvent({
            title: 'Message',
            message: 'Record Changed...!!!',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }
    //create record start

    get typeOptions(){
        return[
            {label: 'Prospect', value: 'Prospect'},
            { label: 'Other', value: 'Other'},
        ];
    }

    typeHandleChange(event){
      this.accObj.Type=event.detail.value;
    }

   get slaOptions(){
        return[
            {label: 'Gold', value: 'Gold'},
            {label: 'Silver', value: 'Silver'},
            {label: 'Bronze', value: 'Bronze'},
        ];
    }

    slaHandleChange(event){
        this.accObj.SLA__c=event.detail.value;

    }

    createNowAccountHandler(){
        this.accObj.Name=this.template.querySelector('lightning-input[data-formfield="Acc"]').value;
     createNewAccount({accData:this.accObj})
     .then(result=>{
        console.log(JSON.stringify(result));
        this.showSuccessToast();
     })
     .catch(error=>{
        console.log(JSON.stringify(error));
     })
    }
    //create Record end
    // Search Record

    searchNowAccountHandler(){

        this.accObj.Name=this.template.querySelector('lightning-input[data-formfield="Account"]').value;

        searchAccount({objAccount:this.accObj.Name})
        .then(result=>{
            this.accObj=result;
            console.log(JSON.stringify(result));
            this.showSearchField= true;
            this.showSearchToast();
            
        })
        .catch(error=>{
            console.log(JSON.stringify(error));
            this.showSearchField=false;
        })
    }

    // edit record

    editNowAccountHandler(){

        this.accObj.Name=this.template.querySelector('lightning-input[data-formfield="Account"]').value;
        this.accObj.Type=this.template.querySelector('lightning-input[data-formfield="Acc1"]').value;
        this.accObj.SLA__c=this.template.querySelector('lightning-input[data-formfield="Acc2"]').value;

        editAccount({objAccount:this.accObj})
        .then(result=>{
            console.log(JSON.stringify(result));
            this.showEditToast();
              
        })
        .catch(error=>{
            console.log(JSON.stringify(error));
            
        })
    }


}