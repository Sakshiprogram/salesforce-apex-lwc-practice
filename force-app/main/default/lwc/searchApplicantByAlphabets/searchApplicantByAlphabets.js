import { LightningElement } from 'lwc';
import searchApplicantByAlpha from '@salesforce/apex/ApplicantProvider.searchApplicantByAlpha';
export default class SearchApplicantByAlphabets extends LightningElement {
    appList;

    columns=[
     {label:'Applicant Id', fieldName:'Name'},
     {label:'First Name', fieldName:'First_Name__c'},
    
    ];

    handleSearch(event){
    let firstName= event.target.value;

    searchApplicantByAlpha({firstName:firstName})
    .then(result=>{
        this.appList=result;

    })
    .catch(error=>{
        console.log(error);
    });
}
}