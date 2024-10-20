
<cftry>
    <cfset noteService = new "/services/NoteService.cfc" />
    <cfset noteService.insertnoteslog(
        userid = userid,
        noteDetails = LEFT(trim(x.note), 2000),
        isPublic = 1,
        audprojectid = new_audprojectid,
        contactid = 0
    ) />
    <cfset isfetch = 1>
    <!--- Update the database to set isfetch = 1 if necessary --->
<cfcatch type="any">
    <cfset errorLog = "[Error in InsertNote_308_22.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
