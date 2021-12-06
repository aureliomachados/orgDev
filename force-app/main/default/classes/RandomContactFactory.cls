
public with sharing class RandomContactFactory {

    public static List<Contact> generateRandomContacts(Integer numberOfContacts, String lName){
        List<Contact> ctts = new List<Contact>();

            for (Integer i = 0; i < numberOfContacts; i++) {
                Contact c = new Contact(FirstName='FirstName ' + i,LastName = lName + ' ' + i);
                ctts.add(c);
            }
        System.debug(ctts);
        return ctts;
    }
}
