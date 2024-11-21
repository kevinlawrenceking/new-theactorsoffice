<cfset auditionLinkService = createObject("component", "services.AuditionLinkService")>
<cfset auditionLinkService.INSaudlinks(
    linkname = NotesEvent.linkname,
    linkurl = NotesEvent.linkurl,
    audroleid = audroleid
)>