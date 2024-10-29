
<cftry>
    <cfset notesContact = createObject("component", "services.NoteService").getNotesLog(
        userID = session.userid,
        contactID = contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesContact_507_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
