
<cftry>
    <cfset findloc = createObject("component", "services.EventService").getvm_events_location_region_country(new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findloc_365_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
