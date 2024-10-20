
<cftry>
    <cfset events = createObject("component", "/services/EventService").getvm_events_eventtypes_user({
        userid: session.userid,
        currentid: currentid
    })>
    <cfcatch type="any">
        <cfset errorLog = "[Error in events_472_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
