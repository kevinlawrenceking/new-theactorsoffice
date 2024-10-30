
<cftry>
    <cfset projectService = createObject("component", "/services/AuditionProjectService")>
    <cfset projectDetails = projectService.DETaudprojects_24543(audprojectID=audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in projectDetails_368_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
