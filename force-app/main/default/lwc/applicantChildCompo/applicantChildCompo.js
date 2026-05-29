import { LightningElement, api } from 'lwc';
import deleteAddresses from '@salesforce/apex/ApplicantProvider.deleteAddresses';
export default class ApplicantChildCompo extends LightningElement {
    @api data;
    @api appList;
    count=0;
    selectedRows = [];

       columns= [
        {label: 'Country', fieldName: 'Country__c', editable:true},
        {label: 'City', fieldName: 'City__c', editable:true},
        {label: 'State', fieldName: 'State__c', editable:true}
       
    ];

    closeDataHandler(){
         const myEvent = new CustomEvent("childdata",{
            detail: false
         });
         this.dispatchEvent(myEvent);
    }



    handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
        this.count = this.selectedRows.length;
     }

    get isDeleteDisabled() {
        return this.count === 0;
     }

    handleDelete() {

    if (this.selectedRows.length === 0) {
        alert('Select at least one record');
        return;
    }

    const idsToDelete = this.selectedRows.map(row => row.Id);

    deleteAddresses({ recordIds: idsToDelete })
        .then(() => {

            // remove from UI
            this.appList = this.appList.filter(
                row => !idsToDelete.includes(row.Id)
            );

            this.count = 0;
            this.selectedRows = [];

            alert('Deleted successfully');
        })
        .catch(error => {
            console.error(error);
        });
}
}