 


<!--- Fetch Page to Get Active Team Contacts --->
<cfset contactService = new "services.ContactService"()>

<!--- Set the userId variable from session --->
<cfset userId = session.userid>

<!--- Pass the userId to the function to fetch team contacts --->
<cfset myTeam = contactService.getActiveTeamContactsByUserId(userId)>