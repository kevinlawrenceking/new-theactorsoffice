
<cftry>
    <cfset result = createObject("component", "services.NoteService").updatenoteslog(recid)>
    <cfcatch>
        <cfset errorLog = "[Error in deletenote_103_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
