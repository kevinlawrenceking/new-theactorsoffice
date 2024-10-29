
<cftry>
    <cfset objNoteService = createObject("component", "/services/NoteService")>
    <cfset objNoteService.updateNotesLog(noteDetails=LEFT(trim(noteDetails),2000), isPublic=isPublic, noteid=noteid)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in updatenote_179_1.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
