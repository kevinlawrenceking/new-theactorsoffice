
<cftry>
    <cfset noteService = new services.NoteService()>
    <cfset noteService.DELnoteslog(noteid=noteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in DeleteNote_4_2.cfm] Error deleting note with ID #noteid#: #cfcatch.message#" type="error">
        <cfthrow message="Failed to delete note." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
