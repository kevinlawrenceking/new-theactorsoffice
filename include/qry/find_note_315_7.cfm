<cfset noteService = createObject("component", "services.NoteService")>
<cfset find_note = noteService.SELnoteslog_24400(
    select_userid = select_userid,
    select_contactid = select_contactid,
    noteDetailsPrefix = left(x.notes, 8)
)>