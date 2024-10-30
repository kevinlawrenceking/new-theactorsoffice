
<cftry>
    <cfset siteLinkService = createObject("component", "services.SiteLinkUserService")>
    <cfset mylinks_user = siteLinkService.SELsitelinks_user_23958(
        userId = session.userid,
        siteTypeId = sitetypes.sitetypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mylinks_user_164_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
