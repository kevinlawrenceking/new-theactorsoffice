
<cftry>
    <cfset findproject = createObject("component", "services.AuditionProjectService").getProjectDetails(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findproject_218_2.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching project details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
