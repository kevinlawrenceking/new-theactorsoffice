
<cftry>
    <cfset eventsService = createObject("component", "/services/EventService")>
    <cfset events = eventsService.getEvents(sessionUserId=session.userid, contactId=rcontactid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in events_501_1.cfm]: #cfcatch.message#">
        <cfset events = queryNew("eventID,recid,eventTitle,eventStart,eventStartTime", "integer,integer,varchar,timestamp,time")>
    </cfcatch>
</cftry>
