import { LightningElement } from 'lwc';
import searchLatest5Record from '@salesforce/apex/ContactProvider.searchLatest5Record';

export default class Latest5ContactRecords extends LightningElement {


columns=[
{label: 'Name', fieldName: 'Name', editable:true},
{label: 'Email', fieldName: 'Email', editable:true},
{label: 'Created Date', fieldName: 'CreatedDate', editable:true}
];

accList;

//contactHandler(){
connectedCallback(){
    searchLatest5Record()
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