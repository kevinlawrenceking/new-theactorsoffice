
<cftry>
    <cfset events = createObject("component", "services.EventService").SELevents_24123(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_232_3.cfm]: #cfcatch.message#">
        <cfset events = queryNew("eventid")>
    </cfcatch>
</cftry>
