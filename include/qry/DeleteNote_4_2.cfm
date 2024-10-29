
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.deleteNoteById(noteid=#noteid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in DeleteNote_4_2.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="Failed to delete note." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
