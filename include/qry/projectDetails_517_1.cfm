
<cftry>
    <cfset projectDetails = createObject("component", "services.AuditionProjectService").getaudprojects(audprojectID)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in projectDetails_517_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
