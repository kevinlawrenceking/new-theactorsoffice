
<!--- This ColdFusion page retrieves audio sources from the database that are not marked as deleted based on a specified audio source identifier. --->

<cftry>
    <cfset findsource = createObject("component", "services.AuditionSourceService").SELaudsources_24359(audsource=y.audsource) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findsource_308_8.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
