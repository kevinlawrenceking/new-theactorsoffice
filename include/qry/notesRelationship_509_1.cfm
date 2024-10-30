
<cftry>
    <cfset notesRelationship = createObject("component", "services.NoteService").SELnoteslog_24704(
        userID = session.userid,
        contactID = contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesRelationship_509_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
