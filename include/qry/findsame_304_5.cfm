
<cftry>
    <cfset systemUserService = createObject("component", "/services/SystemUserService")>
    <cfset findsame = systemUserService.getActiveSystemUsers(new_contactid=new_contactid, new_systemid=new_systemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findsame_304_5.cfm]: #cfcatch.message#">
        <cfset findsame = queryNew("")>
    </cfcatch>
</cftry>
