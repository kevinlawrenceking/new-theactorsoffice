
<cftry>
    <cfset auditionProjectService = createObject("component", "/services/AuditionProjectService")>
    <cfset cos = auditionProjectService.getDistinctValueCompany(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cos_31_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
