public class SampleApex {
public static void applyDiscount(Contact[] Cons) {
for(Contact c:Cons){
c.Test_Value__c*= 0.9;
}
}
}