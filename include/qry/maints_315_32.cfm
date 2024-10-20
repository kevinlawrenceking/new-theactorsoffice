
<cftry>
    <cfset maints = createObject("component", "services.ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in maints_315_32.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
