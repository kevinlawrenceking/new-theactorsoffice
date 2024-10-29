
<cftry>
    <cfset siteLinkService = createObject("component", "/services/SiteLinkUserService")>
    <cfset mylinks_user = siteLinkService.getSiteLinks(
        userId = session.userid,
        siteTypeId = sitetypes.sitetypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mylinks_user_164_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
