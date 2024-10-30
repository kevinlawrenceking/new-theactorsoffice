
<cftry>
    <cfset FindResults = createObject("component", "services.PageService").RESpgpages_24652(pgid=pgid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FindResults_466_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
