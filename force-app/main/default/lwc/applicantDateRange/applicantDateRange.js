import { LightningElement } from 'lwc';
import getApplicants from '@salesforce/apex/ApplicantProvider.getApplicants';
export default class ApplicantDateRange extends LightningElement {
startDate;
endDate;
appList;

columns =[
   {label: 'Applicant Id', fieldName: 'Name', editable:true},    
   {label: 'First Name', fieldName: 'First_Name__c', editable:true},
   {label: 'Last Name', fieldName: 'Last_Name__c', editable:true},
   {label: 'Created Date', fieldName: 'CreatedDate', editable:true},
   {label: 'Created By', fieldName: 'CreatedById', editable:true}

];

handleStartDate(event){
    this.startDate=event.target.value;
}

handleEndDate(event){
 this.endDate=event.target.value;

 if(this.startDate && this.endDate){
    this.fetchApplicants();
 }
}

fetchApplicants(){
    getApplicants({startDate:this.startDate,endDate:this.endDate})
    .then(result=>{
        this.appList=result;
        console.log(result);
    })
    .catch(error=>{
        console.log(error);
    });
}
}