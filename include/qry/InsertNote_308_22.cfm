
<cftry>
    <cfset variables.noteService = createObject("component", "services.NoteService")>
    <cfset variables.noteService.insertNoteLog(
        userid = userid,
        noteDetails = LEFT(trim(x.note), 2000),
        new_audprojectid = new_audprojectid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in InsertNote_308_22.cfm]: #cfcatch.message#"/>
        <cfthrow message="Error in InsertNote_308_22.cfm" detail="#cfcatch.detail#"/>
    </cfcatch>
</cftry>
