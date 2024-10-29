
<cftry>
    <cfset notesEvent = createObject("component", "services.NoteService").getNotesLog(
        userID = session.userid,
        eventID = eventid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesEvent_180_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
