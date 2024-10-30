
<cftry>
    <cfset eventsService = createObject("component", "services.EventService")>
    <cfset events = eventsService.SELevents_24686(sessionUserId=session.userid, contactId=rcontactid)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in events_501_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
