
<cftry>
    <cfset systemUserService = createObject("component", "/services/SystemUserService")>
    <cfset systemUserService.updateUserIsDeleted(suid=suid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in close_294_4.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
