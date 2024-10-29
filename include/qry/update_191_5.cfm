
<cftry>
    <cfset componentPath = "/services/AuditionProjectService.cfc">
    <cfset projectService = createObject("component", componentPath)>
    <cfset projectService.updateProjectDate(new_projdate=y.new_projdate, audprojectID=y.audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in update_191_5.cfm]: #cfcatch.message#"/>
        <cfrethrow/>
    </cfcatch>
</cftry>
