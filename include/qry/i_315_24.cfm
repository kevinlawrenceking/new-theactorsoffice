
<cftry>
    <cfset i = createObject("component", "services.ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in i_315_24.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
