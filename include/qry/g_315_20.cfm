
<cftry>
    <cfset g = createObject("component", "/services/ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in g_315_20.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
