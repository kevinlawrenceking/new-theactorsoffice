
<cftry>
    <cfset events = createObject("component", "/services/EventService.cfc").getvm_events_eventtypes_user(session.userid, rcontactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_505_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
