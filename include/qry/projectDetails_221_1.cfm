
<cftry>
    <cfset projectService = createObject("component", "services.AuditionProjectService")>
    <cfset projectDetails = projectService.getProjectDetails(audprojectID=audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in projectDetails_221_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
