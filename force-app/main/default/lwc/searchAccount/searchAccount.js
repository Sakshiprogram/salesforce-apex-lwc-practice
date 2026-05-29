import { LightningElement } from 'lwc';
import searchAccount from '@salesforce/apex/AccountProvider.searchAccount';
export default class SearchAccount extends LightningElement {
    
    objAcc = {'sObjectType':'Account'}

    searchAccountHandler(){
      console.log('you are inside Js method');

     this.objAcc.Name=this.template.querySelector('lightning-input[data-formfield="Acc"]').value;
    console.log(this.objAcc.Name);

    searchAccount({objAccount:this.objAcc.Name})
    .then(result=>{
        this.objAcc=result;
    })
    .catch(error=>{
        console.log(error)
    })
    }
}