
<cftry>
    <cfset u = createObject("component", "services.ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in u_315_28.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
