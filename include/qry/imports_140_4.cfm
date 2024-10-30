
<cftry>
    <cfset imports = createObject("component", "services.AuditionImportService").SELauditionsimport_23919()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in imports_140_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
