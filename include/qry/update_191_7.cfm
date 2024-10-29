
<cftry>
    <cfset componentPath = "/services/AuditionProjectService.cfc">
    <cfset projectService = createObject("component", componentPath)>
    <cfset projectService.updateProjectDate(new_projdate=z.new_projdate, audprojectID=z.audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_191_7.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
