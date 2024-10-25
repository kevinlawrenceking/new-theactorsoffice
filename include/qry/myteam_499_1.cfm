 


<cfset contactService = new "services.ContactService"()>
<cfset myTeam = contactService.getActiveTeamContactsByUserId()>