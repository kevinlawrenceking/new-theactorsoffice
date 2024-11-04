
    <!--- Call the SELfunotifications_24709 function from NotificationService and pass userID --->
    <cfset variables.notsActive = createObject("component", "services.NotificationService").SELfunotifications_24709(userid=userid)>
