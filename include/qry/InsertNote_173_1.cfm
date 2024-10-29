
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.insertNoteLog(
        userid = userid,
        contactid = rcontactid,
        noteDetails = LEFT(trim(noteDetails), 2000),
        isPublic = isPublic,
        eventid = eventid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in InsertNote_173_1.cfm] #cfcatch.message# - #cfcatch.detail#">
        <cfthrow message="Error in InsertNote_173_1.cfm" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
