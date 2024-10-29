
<cftry>
    <cfset FindLinksExtra = createObject("component", "services.PageAppLinkService").getDistinctPluginNames(pgid=findpage.pgid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindLinksExtra_188_10.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
