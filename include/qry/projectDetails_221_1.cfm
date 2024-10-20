
<cftry>
    <cfset projectDetails = createObject("component", "services.AuditionProjectService").getaudprojects(audprojectID=audprojectID)>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in projectDetails_221_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
