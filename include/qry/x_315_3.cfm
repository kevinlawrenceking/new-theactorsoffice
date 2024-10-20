
<cftry>
    <cfset x = createObject("component", "/services/ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_315_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
