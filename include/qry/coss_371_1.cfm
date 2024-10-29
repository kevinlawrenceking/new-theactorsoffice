
<cftry>
    <cfset auditionProjectService = createObject("component", "/services/AuditionProjectService.cfc")>
    <cfset coss = auditionProjectService.getDistinctContactIds(userid=userid, sel_coname=sel_coname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in coss_371_1.cfm]: #cfcatch.message#">
        <cfset coss = queryNew("contactid", "integer")>
    </cfcatch>
</cftry>
