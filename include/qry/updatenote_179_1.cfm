
<cftry>
    <cfset noteService = new "/services/NoteService.cfc"()>
    <cfset result = noteService.updatenoteslog(
        noteDetails = LEFT(trim(noteDetails), 2000),
        isPublic = isPublic,
        noteid = noteid
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updatenote_179_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
