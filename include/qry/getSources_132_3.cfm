
<cftry>
    <cfset auditionSourceService = createObject("component", "services.AuditionSourceService")>
    <cfset getSources = auditionSourceService.SELaudsources()>
    <cfcatch>
        <cflog file="errorLog" text="[Error in getSources_132_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
