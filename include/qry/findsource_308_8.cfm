
<cftry>
    <cfset findsource = createObject("component", "services.AuditionSourceService").getAudSources(audsource=y.audsource)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findsource_308_8.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
