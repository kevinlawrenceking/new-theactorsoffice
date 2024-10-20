
<cftry>
    <cfset e = createObject("component", "/services/ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in e_315_16.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
