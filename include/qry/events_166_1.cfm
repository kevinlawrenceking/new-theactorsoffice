
<cftry>
    <cfset events = createObject("component", "/services/AuditionProjectService").getDistinctAudProjectIds(mediaid=mediaid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_166_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching the data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
