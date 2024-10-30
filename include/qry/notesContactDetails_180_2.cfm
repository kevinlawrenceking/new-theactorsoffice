
<cftry>
    <cfset notesContactDetails = createObject("component", "services.NoteService").DETnoteslog(updateNoteID=updatenoteid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesContactDetails_180_2.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving note details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
