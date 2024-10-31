
<cftry>
    <cfset myService = createObject("component", "/services/SiteLinkUserService")>
    <cfset mylinks_user_del = myService.SELsitelinks_user_23959(
        userId = session.userid,
        siteTypeId = sitetypes.sitetypeid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mylinks_user_del_164_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
