
<cftry>
    <cfset Booked_check = createObject("component", "services.EventService").getevents(audroleid=audroleid, audstepid=5)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Booked_check_29_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
