
<cftry>
    <cfset variables.noteService = createObject("component", "/services/NoteService")>
    <cfset variables.noteService.insertNoteLog(userid=userid, newcontactid=newcontactid, newnoteDetails=LEFT(trim(newnoteDetails), 2000))>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in InsertNote_4_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the note log." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
