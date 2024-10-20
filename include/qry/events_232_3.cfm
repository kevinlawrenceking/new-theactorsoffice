
<cftry>
    <cfset events = createObject("component", "services.EventService").getevents(audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_232_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
