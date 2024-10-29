
<cftry>
    <cfset events = createObject("component", "services.EventService").getEventDetails(sessionUserID=session.userid, contactID=rcontactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in events_505_1.cfm]: #cfcatch.message#">
        <cfset events = queryNew("eventID, recid, eventTitle, eventStart, eventStartTime")>
    </cfcatch>
</cftry>
