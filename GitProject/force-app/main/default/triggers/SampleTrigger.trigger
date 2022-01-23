trigger SampleTrigger on Contact (before insert) {
Contact[] Cons = Trigger.new;
SampleApex.applyDiscount(Cons);
}