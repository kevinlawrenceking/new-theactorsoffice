
<cftry>
    <cfset events = createObject("component", "services.EventService").getvm_events_eventtypes_user(session.userid, rcontactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in events_501_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
