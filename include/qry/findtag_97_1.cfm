
    
<!--- Fetch Page to Get Active Team Contacts --->
<cfset contactItemService = new "services.ContactService"()>

<!--- Set the userId variable from session --->
<cfset contactid = myteam.contactid>

<!--- Pass the userId to the function to fetch team contacts --->
<cfset findtag = contactItemService.getActiveTeamContactsByUserId(contactid)>
