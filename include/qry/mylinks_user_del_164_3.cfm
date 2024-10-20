
<cftry>
    <cfset mylinks_user_del = createObject("component", "services.SiteLinkUserService").getvm_sitelinks_user_sitetypes_user(session.userid, sitetypes.sitetypeid)>
<cfcatch>
    <cfset errorLog = "[Error in mylinks_user_del_164_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
