
<cftry>
    <cfset notesContact = createObject("component", "/services/NoteService.cfc").getvm_noteslog_contactdetails(session.userid, contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesContact_507_1.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
