
<cftry>
    <cfset notesRelationship = createObject("component", "services.NoteService").getvm_noteslog_contactdetails(session.userid, contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notesRelationship_509_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
