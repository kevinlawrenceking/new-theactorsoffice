
<cftry>
    <cfset notesaud = createObject("component", "/services/NoteService").getnoteslog(audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in notesaud_506_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
