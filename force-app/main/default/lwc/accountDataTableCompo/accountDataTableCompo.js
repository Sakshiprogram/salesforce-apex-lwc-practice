import { LightningElement } from 'lwc';
import searchAccount from '@salesforce/apex/AccountProvider.searchAccount';

const columns= [
        {label: 'Name', fieldName: 'Name', editable:true},
        {label: 'SLA', fieldName: 'SLA__c', editable:true},
        {label: 'Type', fieldName: 'Type', editable:true},
        {label: 'CreatedDate', fieldName: 'CreatedDate', editable:true}
    ];

export default class AccountDataTableCompo extends LightningElement {

    columns=columns;
    objAccount={'sObjectType':'Account'} 
    accList;
    showTableFlag=false;

    searchAccountHandler(){
        this.objAccount.Name= this.template.querySelector('lightning-input[data-formfield="Acc"]').value;

        searchAccount({objAccount:this.objAccount})
        .then(result=>{
            console.log(JSON.stringify(result));
            this.accList=result;
            this.showTableFlag=true;
        })
        .catch(error=>{
            console.log(JSON.stringify(error));
            this.showTableFlag=false;
        })
    }
}