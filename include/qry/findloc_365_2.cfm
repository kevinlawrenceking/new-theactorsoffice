
<cftry>
    <cfset findloc = createObject("component", "services.EventService").SELevents_24527(new_eventid=new_eventid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findloc_365_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
