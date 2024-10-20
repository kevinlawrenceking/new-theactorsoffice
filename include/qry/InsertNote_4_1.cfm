
<cftry>
    <cfset noteService = new "/services/NoteService.cfc" />
    <cfset result = noteService.insertnoteslog(
        userid = userid,
        contactid = newcontactid,
        noteDetails = LEFT(trim(newnoteDetails), 2000)
    ) />
<cfcatch type="any">
    <cfset errorLog = "[Error in InsertNote_4_1.cfm]: " & cfcatch.message />
</cfcatch>
</cftry>
