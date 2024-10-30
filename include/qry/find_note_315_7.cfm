
<cftry>
    <cfset find_note = createObject("component", "services.NoteService").SELnoteslog_24400(
        select_userid = select_userid,
        select_contactid = select_contactid,
        noteDetailsPrefix = left(x.notes, 8)
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in find_note_315_7.cfm]: #cfcatch.message#">
        <cfthrow message="Error retrieving notes log." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
