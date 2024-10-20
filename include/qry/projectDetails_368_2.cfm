
<cftry>
    <cfset projectDetails = createObject("component", "/services/AuditionProjectService").getaudprojects(audprojectID)>
<cfcatch>
    <cfset errorLog = "[Error in projectDetails_368_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
