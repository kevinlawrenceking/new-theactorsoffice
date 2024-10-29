
<cftry>
    <cfset audSourceService = createObject("component", "/services/AuditionSourceService")>
    <cfset audsources = audSourceService.getAudSources(false)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsources_281_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
