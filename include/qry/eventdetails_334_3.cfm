
<cftry>
    <cfset eventdetails = createObject("component", "services.EventService").getevents(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in eventdetails_334_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
