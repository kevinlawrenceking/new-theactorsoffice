
<cftry>
    <cfset jsons_myteam = createObject("component", "services.EventService").SELevents_23803(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in jsons_myteam_50_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
