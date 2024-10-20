
<cftry>
    <cfset find2 = createObject("component", "services.SiteLinkUserService").getsitelinks_user(x.sitename, users.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find2_318_17.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
