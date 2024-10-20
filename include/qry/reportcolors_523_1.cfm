
<cftry>
    <cfset reportColorService = new services.ReportColorService()>
    <cfset reportcolors = reportColorService.getreportcolors()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in reportcolors_523_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
