
<cftry>
    <cfset j = createObject("component", "/services/ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in j_315_26.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
