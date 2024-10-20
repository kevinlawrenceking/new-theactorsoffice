
<cftry>
    <cfset eventdetails = createObject("component", "/services/EventService").getevents(eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in eventdetails_335_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
