import { LightningElement } from 'lwc';

import searchLatest10Records from '@salesforce/apex/AccountProvider.searchLatest10Records';

export default class Latest10AccountRecords extends LightningElement {

  columns =[
{label: 'Name', fieldName: 'Name', editable:true},
{label: 'Type', fieldName: 'Type', editable:true},
{label: 'SLA', fieldName: 'SLA__c', editable:true},
{label: 'Rating', fieldName: 'Rating', editable:true}
  ];

accList;

//searchHandler(){
connectedCallback(){
    searchLatest10Records()
    .then(result=>{
        console.log(JSON.stringify(result));
        this.accList=result;
    })
    .catch(error=>{
        console.log(JSON.stringify(error));
    })
//}
}

}