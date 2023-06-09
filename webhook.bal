import ballerinax/trigger.asgardeo;
import ballerina/http;
import ballerina/log;

configurable asgardeo:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener asgardeo:Listener webhookListener =  new(config,httpListener);

service asgardeo:UserOperationService on webhookListener {
  
    remote function onLockUser(asgardeo:GenericEvent event ) returns error? {
      log:printInfo(event.toString());
    }
    remote function onUnlockUser(asgardeo:GenericEvent event ) returns error? {
      log:printInfo(event.toString());
    }
    remote function onUpdateUserCredentials(asgardeo:GenericEvent event ) returns error? {
      log:printInfo(event.toString());
    }
    remote function onDeleteUser(asgardeo:GenericEvent event ) returns error? {
      log:printInfo(event.toString());
    }
    remote function onUpdateUserGroup(asgardeo:UserGroupUpdateEvent event ) returns error? {
      log:printInfo(event.toString());
    }
}

service /ignore on httpListener {}
