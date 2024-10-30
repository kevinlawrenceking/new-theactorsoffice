
<cftry>
    <cfset events = createObject("component", "services.EventService").SELevents_24659(sessionUserID=session.userid, currentID=variables.currentid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_472_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
