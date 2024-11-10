<cfset linkService = createObject("component", "services.LinkService")>
<cfset linkService.INSlinks(
    linkname = linkname,
    linkurl = linkurl,
    noteid = noteid,
    userid = userid
)>