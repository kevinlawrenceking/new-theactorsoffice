
<cftry>
    <cfset projectDetails = createObject("component", "services.AuditionProjectService").getaudprojects(audprojectID)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in projectDetails_222_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
