
<cftry>
    <cfset noteService = new "/services/NoteService.cfc"()>
    <cfset noteService.deletenoteslog(updatenoteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in DeleteNote_4_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
