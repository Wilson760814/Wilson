trigger ContactBeforeInsertUpdate on Contact (before Insert, before Update) {
List<Contact> ContactList=trigger.new;
for(Contact c:ContactList)
{
    if(trigger.isInsert)
         {c.description='ContactBeforeInsert ';}
         else if(trigger.isUpdate)
         {c.description='ContactBeforeUpdate ';}
}
}