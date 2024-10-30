
<cftry>
    <cfset x = createObject("component", "services.SiteLinkUserService").SELsitelinks_user(siteIcon="unknown.png")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_91_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
