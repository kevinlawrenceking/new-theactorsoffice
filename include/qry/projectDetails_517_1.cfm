
<cftry>
    <cfset projectDetails = createObject("component", "services.AuditionProjectService").getProjectDetails(audprojectID=audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in projectDetails_517_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
