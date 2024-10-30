
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.DELnoteslog_23709(noteId=updatenoteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in DeleteNote_4_4.cfm] Error deleting note with ID #updatenoteid#: #cfcatch.message#">
        <cfthrow message="An error occurred while deleting the note." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
