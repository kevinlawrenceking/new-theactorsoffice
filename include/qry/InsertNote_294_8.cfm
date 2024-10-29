
<cftry>
    <cfset noteService = createObject("component", "/services/NoteService")>
    <cfset noteService.insertNoteLog(
        userid = userid,
        contactid = contactid,
        noteDetails = "Moved to Maintenance Track.",
        isPublic = true,
        eventid = 0
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in InsertNote_294_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
