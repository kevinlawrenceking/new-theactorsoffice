
<cftry>
    <cfset jsons_myteam = createObject("component", "services.EventService").getDistinctEventDetails(userId=session.userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in jsons_myteam_50_2.cfm]: #cfcatch.message#">
        <cfset jsons_myteam = queryNew("col1")>
    </cfcatch>
</cftry>
