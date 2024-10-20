
<cftry>
    <cfset noteService = new "/services/NoteService.cfc"()>
    <cfset result = noteService.insertnoteslog(
        userid = userid,
        contactid = rcontactid,
        noteDetails = LEFT(trim(noteDetails), 2000),
        isPublic = isPublic,
        audprojectid = audprojectid,
        notedetailshtml = new_notetext
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in InsertNote_169_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
