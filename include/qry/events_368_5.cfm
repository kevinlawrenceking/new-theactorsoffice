
<cftry>
    <cfset events = createObject("component", "services.EventService").SELevents_24546(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_368_5.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
