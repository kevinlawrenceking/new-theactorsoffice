<cfset noteService = createObject("component", "services.NoteService")>
<cfset noteService.INSnoteslog_24401(
    userid = select_userid,
    contactid = select_contactid,
    noteDetails = trim(x.Notes)
)>