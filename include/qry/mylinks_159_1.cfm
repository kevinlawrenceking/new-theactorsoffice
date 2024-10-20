
<cftry>
    <cfset mylinks = createObject("component", "services.SiteLinkUserService").getvm_sitelinks_user_sitetypes_user(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in mylinks_159_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
