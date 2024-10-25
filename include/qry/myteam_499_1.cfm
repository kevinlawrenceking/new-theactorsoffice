
<!--- Fetch Page to Get Active Team Contacts --->
<cfset contactService = createObject("component", "ContactService")>

<cfset userId = session.userid>
<cfset myTeam = contactService.getActiveTeamContactsByUserId(userId)>