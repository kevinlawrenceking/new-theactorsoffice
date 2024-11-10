<cfset noteService = createObject("component", "services.NoteService")>
<cfset noteService.INSnoteslog_24319(
    userid = userid,
    contactid = contactid,
    noteDetails = "Moved to Maintenance Track.",
    isPublic = true,
    eventid = 0
)>