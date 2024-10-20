
<cftry>
    <cfset noteService = new "/services/NoteService.cfc"()>
    <cfset noteService.insertnoteslog(
        userid = select_userid,
        contactid = select_contactid,
        noteDetails = trim(x.Notes),
        ispublic = 1
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in InsertNote_315_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
