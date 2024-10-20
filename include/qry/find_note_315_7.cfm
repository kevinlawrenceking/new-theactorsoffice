
<cftry>
    <cfset find_note = createObject("component", "/services/NoteService").getnoteslog(
        userid = select_userid,
        contactid = select_contactid,
        noteDetailsPattern = left(x.notes, 8)
    )>
    <cfcatch>
        <cfset errorLog = "[Error in find_note_315_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
