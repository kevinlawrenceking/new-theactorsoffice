
<cftry>
    <cfset notesService = createObject("component", "services.NoteService")>
    <cfset notesContactDetails = notesService.getNoteDetails(updateNoteID=updatenoteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesContactDetails_180_2.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving note details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
