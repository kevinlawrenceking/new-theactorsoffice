
<cftry>
    <cfset componentPath = "/services/AuditionProjectService.cfc">
    <cfset objAuditionProjectService = createObject("component", componentPath)>
    <cfset objAuditionProjectService.UPDaudprojects_24019(projDate="#arguments.projDate#")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in fix_191_9.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
