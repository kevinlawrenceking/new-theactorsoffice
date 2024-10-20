
<cftry>
    <cfset noteService = new "/services/NoteService.cfc"()>
    <cfset result = noteService.insertnoteslog(
        userid = userid,
        contactid = 0,
        eventid = new_eventid,
        noteDetails = trim(noteDetails),
        ispublic = 1
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in InsertNote_14_8.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
