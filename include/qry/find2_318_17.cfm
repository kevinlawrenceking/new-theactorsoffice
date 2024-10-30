
<cftry>
    <cfset find2 = createObject("component", "services.SiteLinkUserService").SELsitelinks_user_24448(
        sitename = x.sitename,
        userid = users.userid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find2_318_17.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
