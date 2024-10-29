
<cftry>
    <cfset systemUserService = createObject("component", "services.SystemUserService")>
    <cfset rels = systemUserService.getActiveSystemUsers(currentid=currentid, sessionUserId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rels_519_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
