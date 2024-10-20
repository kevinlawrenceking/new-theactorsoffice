
<cftry>
    <cfset h = createObject("component", "/services/ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in h_315_22.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
