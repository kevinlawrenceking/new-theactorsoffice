
<cftry>
    <cfset find = createObject("component", "services.AuditionProjectService").getAudProjects(projname=y.projname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_308_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving projects." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
