<cfset actionUserService = createObject("component", "services.ActionUserService")>
<cfset insertedCount = actionUserService.updateActionUsers(userid=userid, target_id_system=target_id_system)>


<cfoutput>
    Number of actions inserted: #insertedCount#
</cfoutput>
<cfabort>