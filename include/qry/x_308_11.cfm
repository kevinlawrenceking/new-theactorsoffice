
<!--- This ColdFusion page retrieves audition records based on a specific record ID and filters for valid statuses. --->
<cftry>
    <cfset x = createObject("component", "services.AuditionImportService").SELauditionsimport_24362(recordid=#recordid#) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in x_308_11.cfm]: #cfcatch.message#"/>
    </cfcatch>
</cftry>
