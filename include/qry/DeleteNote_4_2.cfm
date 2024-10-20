
<cftry>
    <cfset noteService = new services.NoteService()>
    <cfset noteService.deletenoteslog(noteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in DeleteNote_4_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
