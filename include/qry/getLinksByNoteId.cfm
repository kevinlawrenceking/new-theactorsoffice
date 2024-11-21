<cfset LinkService = createObject("component", "services.LinkService")>
<cfset LinkService.getLinksByNoteId(
    noteid = new_noteid
)>