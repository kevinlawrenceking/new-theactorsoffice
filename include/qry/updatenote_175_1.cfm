
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.updateNotesLog(
        noteDetails = LEFT(trim(noteDetails), 2000),
        new_noteText = trim(new_notetext),
        isPublic = isPublic,
        noteid = noteid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in updatenote_175_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
