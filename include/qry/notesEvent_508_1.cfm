
<cftry>
    <cfset notesEvent = createObject("component", "/services/NoteService").getnoteslog(session.userid, eventid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notesEvent_508_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
