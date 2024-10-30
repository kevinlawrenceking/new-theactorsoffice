
<cftry>
    <cfset notesaud = createObject("component", "services.NoteService").SELnoteslog_24698(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in notesaud_506_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
