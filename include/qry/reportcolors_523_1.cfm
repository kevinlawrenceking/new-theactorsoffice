
<cftry>
    <cfset reportColorService = createObject("component", "services.ReportColorService")>
    <cfset reportcolors = reportColorService.getReportColors()>
    <cfcatch>
        <cflog file="errorLog" text="[Error in reportcolors_523_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
