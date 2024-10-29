
<cftry>
    <cfset noteService = createObject("component", "/services/NoteService")>
    <cfset noteService.insertNotesLog(
        userid = userid,
        contactid = rcontactid,
        noteDetails = LEFT(trim(noteDetails), 2000),
        isPublic = isPublic,
        audprojectid = audprojectid,
        notedetailshtml = new_notetext
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in InsertNote_169_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
