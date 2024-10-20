
<cftry>
    <cfset noteService = new "/services/NoteService.cfc" />
    <cfset noteService.insertnoteslog(
        userid = userid,
        contactid = rcontactid,
        noteDetails = LEFT(trim(noteDetails), 2000),
        isPublic = isPublic,
        eventid = eventid,
        notedetailshtml = new_notetext
    ) />
    <cfset isfetch = 1 />
    <!--- Update the database or perform any additional operations here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in InsertNote_171_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
