
<cftry>
    <cfset auditionSourceService = new "/services/AuditionSourceService.cfc"()>
    <cfset getSources = auditionSourceService.getAudSources()>
    <cfcatch>
        <cflog file="errorLog" text="[Error in getSources_132_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
