
<cftry>
    <cfset x = createObject("component", "/services/SiteLinksMasterService").getSiteLinks()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_318_15.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
