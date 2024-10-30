
<cftry>
    <cfset find_source = createObject("component", "services.AuditionSourceService").SELaudsources_24371(audsource=x.audsource)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_source_308_20.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
