
<cftry>
    <cfset notesRelationship = createObject("component", "services.NoteService").getNotesLog(
        userID = session.userid,
        contactID = contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesRelationship_509_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
