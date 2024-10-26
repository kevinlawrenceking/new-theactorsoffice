 

    
<!--- Fetch Page to Get Active Team Contacts --->
<cfset NotificationService = new "services.NotificationService"()>



<!--- Pass the userId to the function to fetch team contacts --->
<cfset notsActives = NotificationService.getfunotifications(userid)>
