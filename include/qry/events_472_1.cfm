
<cftry>
    <cfset events = createObject("component", "/services/EventService").getEventDetails(
        sessionUserID = session.userid,
        currentID = (isDefined('currentid') ? currentid : 0)
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_472_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
