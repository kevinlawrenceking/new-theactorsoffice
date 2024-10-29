
<cftry>
    <cfset cdcheck = createObject("component", "services.AuditionProjectService").getAudProjectDetails(audprojectID=#audprojectID#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cdcheck_368_9.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while fetching project details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
