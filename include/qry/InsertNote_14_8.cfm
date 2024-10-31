
<cftry>
    <cfset noteService = createObject("component", "/services/NoteService")>
    <cfset noteService.INSnoteslog_23730(userid=userid, new_eventid=new_eventid, noteDetails=trim(noteDetails))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in InsertNote_14_8.cfm]: #cfcatch.message#">
        <cfthrow message="Error in InsertNote_14_8.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
