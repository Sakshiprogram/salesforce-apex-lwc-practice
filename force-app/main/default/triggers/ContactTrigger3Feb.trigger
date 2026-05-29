trigger ContactTrigger3Feb on Contact (after insert, after update, after delete, after undelete) {

    if(trigger.isInsert && trigger.isafter){
        ContactTrigger3FebHandler.afterInsert(trigger.new);
    }
    
    if(trigger.isUpdate && trigger.isafter){ 
        ContactTrigger3FebHandler.afterUpdate(trigger.new);
    }
    
    if(trigger.isDelete && trigger.isafter){ 
        ContactTrigger3FebHandler.afterDelete(trigger.old);
    }
    
    if(trigger.isUndelete && trigger.isafter){
        ContactTrigger3FebHandler.afterUndelete(trigger.new);
    }
}