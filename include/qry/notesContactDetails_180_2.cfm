
<cftry>
    <cfset notesContactDetails = createObject("component", "/services/NoteService").getnoteslog(updatenoteid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notesContactDetails_180_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
