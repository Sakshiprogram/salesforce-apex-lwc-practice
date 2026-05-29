import { LightningElement } from 'lwc';
import searchContact from '@salesforce/apex/AccountProvider.searchContact';
export default class SearchContactCompo extends LightningElement {

   columns= [
        {label: 'Name', fieldName: 'Name', editable:true},
        {label: 'Email', fieldName: 'Email', editable:true}
        
       
    ];
    accList;

 objAcc= {'sObjectType':'Account'}

    searchHandler(){

       this.objAcc.Name= this.template.querySelector('lightning-input[data-formfield="Acc"]').value;
        
       searchContact({objAcc:this.objAcc})
          .then(result=>{
             console.log(JSON.stringify(result));
             this.accList=result;
          })
          .catch(error=>{
            console.log(JSON.stringify(error));
            this.accList=result;
          })
        }

}