
<cftry>
    <cfset x = createObject("component", "/services/SiteLinkUserService").getsitelinks_user()>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_91_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
