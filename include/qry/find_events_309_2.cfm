
<cftry>
    <cfset find_events = createObject("component", "services.EventService").SELevents_24379(
        eventtypename = linkdetails.eventtypename,
        userid = linkdetails.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_events_309_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
