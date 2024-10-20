
<cftry>
    <cfset noteService = new "/services/NoteService.cfc"()>
    <cfset noteService.insertnoteslog(
        userid = userid,
        contactid = contactid,
        noteDetails = "Moved to Maintenance Track.",
        isPublic = 1,
        eventid = 0
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in InsertNote_294_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
