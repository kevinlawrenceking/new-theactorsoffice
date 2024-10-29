
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.insertNoteLog(
        userid = select_userid,
        contactid = select_contactid,
        noteDetails = trim(x.Notes)
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in InsertNote_315_8.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the note log." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
