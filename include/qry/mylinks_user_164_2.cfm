
<cftry>
    <cfset mylinks_user = createObject("component", "services.SiteLinkUserService").getvm_sitelinks_user_sitetypes_user(session.userid, sitetypes.sitetypeid)>
<cfcatch>
    <cfset errorLog = "[Error in mylinks_user_164_2.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
