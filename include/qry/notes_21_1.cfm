
<cftry>
    <cfset notesService = new "/services/NoteService.cfc"()>
    <cfset notes = notesService.getnoteslog(noteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notes_21_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
