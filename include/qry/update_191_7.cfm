
<cftry>
    <cfset componentPath = "/services/AuditionProjectService.cfc">
    <cfset componentInstance = createObject("component", componentPath)>
    <cfset componentInstance.UPDaudprojects_24017(new_projdate=z.new_projdate, audprojectID=z.audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_191_7.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
