
<cftry>
    <cfset siteLinkService = createObject("component", "services.SiteLinkUserService")>
    <cfset siteLinkService.insertSiteLink(
        sitename = x.sitename,
        siteurl = x.siteurl,
        siteicon = x.siteicon,
        sitetypeid = new_sitetypeid,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_318_18.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
