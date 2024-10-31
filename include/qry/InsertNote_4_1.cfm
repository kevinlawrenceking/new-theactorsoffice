
<cftry>
    <cfset noteService = createObject("component", "services.NoteService")>
    <cfset noteService.INSnoteslog(userid=userid, newcontactid=newcontactid, newnoteDetails=LEFT(trim(newnoteDetails), 2000))>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in InsertNote_4_1.cfm] Error inserting into noteslog: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the note log." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
