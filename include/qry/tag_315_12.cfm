
<cftry>
    <cfset tag = createObject("component", "/services/ContactImportService").getcontactsimport(new_uploadid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in tag_315_12.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
