
<cftry>
    <cfset auditionSourceService = new "/services/AuditionSourceService.cfc"()>
    <cfset getSources = auditionSourceService.getaudsources()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in getSources_132_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
