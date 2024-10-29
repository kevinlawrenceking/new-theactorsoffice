
<cftry>
    <cfset events = createObject("component", "/services/EventService").getEventDetails(audroleid=audroleid, focusid=focusid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_424_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving event details." detail="#cfcatch.message#">
    </cfcatch>
</cftry>
