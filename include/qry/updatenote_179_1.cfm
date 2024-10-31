
<cftry>
    <cfset variables.noteService = createObject("component", "/services/NoteService")>
    <cfset variables.noteService.UPDnoteslog_23980(
        noteDetails = LEFT(trim(noteDetails), 2000),
        isPublic = isPublic,
        noteid = noteid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in updatenote_179_1.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
