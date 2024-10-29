
<cftry>
    <cfset Booked_check = createObject("component", "services.EventService").getEvents(audroleid=#audroleid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Booked_check_29_8.cfm]: #cfcatch.message#" />
        <cfset Booked_check = queryNew("") />
    </cfcatch>
</cftry>
