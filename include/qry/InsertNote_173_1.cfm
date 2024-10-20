
<cftry>
    <cfset noteService = new "/services/NoteService.cfc"()>
    <cfset result = noteService.insertnoteslog(
        userid = userid,
        contactid = rcontactid,
        noteDetails = LEFT(trim(noteDetails),2000),
        isPublic = isPublic,
        eventid = eventid
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in InsertNote_173_1.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
