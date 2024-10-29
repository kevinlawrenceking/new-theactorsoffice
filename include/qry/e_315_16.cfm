
<cftry>
    <cfset e = createObject("component", "services.ContactImportService").getFilteredContactsImport(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in e_315_16.cfm]: #cfcatch.message#">
        <cfset e = queryNew("")>
    </cfcatch>
</cftry>
