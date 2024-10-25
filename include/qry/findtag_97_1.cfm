
    
<!--- Fetch Page to Get Active Team Contacts --->
<cfset contactItemService = new "services.ContactItemService"()>

<!--- Set the contactid variable from session --->
<cfset contactid = myteam.contactid>

<!--- Pass the userId to the function to fetch team contacts --->
<cfset findtag = contactItemService.findTeamTags(contactid)>
