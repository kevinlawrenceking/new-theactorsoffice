
<cftry>
    <cfset variables.noteService = createObject("component", "services.NoteService")>
    <cfset variables.noteService.INSnoteslog_24319(
        userid = userid,
        contactid = contactid,
        noteDetails = "Moved to Maintenance Track.",
        isPublic = true,
        eventid = 0
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in InsertNote_294_8.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
