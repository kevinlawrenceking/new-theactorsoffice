
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.UPDnoteslog(recid=recid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in deletenote_103_1.cfm] Error updating noteslog_tbl: #cfcatch.message#">
        <cflog file="errorLog" type="error" text="[Error in deletenote_103_1.cfm] Query Error: #cfcatch.detail#">
        <cflog file="errorLog" type="error" text="[Error in deletenote_103_1.cfm] Parameters: recid=#recid#">
    </cfcatch>
</cftry>
