
<cftry>
    <cfset events_nobooking = createObject("component", "services.EventService").SELevents_24547(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_nobooking_368_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
