
<cftry>
    <cfset projectService = createObject("component", "/services/AuditionProjectService")>
    <cfset projectDetails = projectService.getProjectDetails(audprojectID=#audprojectID#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in projectDetails_222_6.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving project details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
