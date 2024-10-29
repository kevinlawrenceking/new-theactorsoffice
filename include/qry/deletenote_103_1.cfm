
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.updateNoteIsDeleted(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in deletenote_103_1.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
