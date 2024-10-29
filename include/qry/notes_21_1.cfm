
<cftry>
    <cfset notesService = createObject("component", "/services/NoteService")>
    <cfset notes = notesService.getNotesLogByNoteId(noteid=noteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notes_21_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
