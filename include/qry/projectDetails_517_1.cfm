
<cftry>
    <cfset projectService = createObject("component", "services.AuditionProjectService")>
    <cfset projectDetails = projectService.DETaudprojects_24716(audprojectID=audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in projectDetails_517_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
