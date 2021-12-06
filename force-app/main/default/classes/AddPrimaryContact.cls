public with sharing class AddPrimaryContact implements Queueable{

    private Contact contact;
    private String stateAbrev;

    public AddPrimaryContact(Contact contact, String stateAbrev) {
        contact = contact;
        stateAbrev = stateAbrev;
    }

    public void execute(QueueableContext context){
        
    }
}
