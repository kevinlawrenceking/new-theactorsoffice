
<cftry>
    <cfset noteService = createObject("component", "/services/NoteService")>
    <cfset result = noteService.updatenoteslog()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in CLEAN_169_2.cfm] " & cfcatch.message>
    </cfcatch>
</cftry>
