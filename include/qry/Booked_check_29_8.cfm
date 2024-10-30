
<cftry>
    <cfset Booked_check = createObject("component", "services.EventService").SELevents_23788(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Booked_check_29_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
