
<cftry>
    <cfset variables.noteService = createObject("component", "/services/NoteService")>
    <cfset variables.noteService.INSnoteslog_23969(
        userid = userid,
        contactid = rcontactid,
        noteDetails = LEFT(trim(noteDetails),2000),
        isPublic = isPublic,
        eventid = eventid,
        notedetailshtml = new_notetext
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in InsertNote_171_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the note log." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
