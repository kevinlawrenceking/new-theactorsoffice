
<cftry>
    <cfset systemUserService = createObject("component", "/services/SystemUserService")>
    <cfset systemUserService.updateUserDeletionStatus(idList=idlist, newSystemId=new_systemid)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in deletesystem_104_2.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
