
<cftry>
    <cfset notesEvent = createObject("component", "services.NoteService").SELnoteslog_24702(
        userID = session.userid,
        eventID = eventid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesEvent_508_1.cfm]: #cfcatch.message#; Detail: #cfcatch.detail#">
    </cfcatch>
</cftry>
