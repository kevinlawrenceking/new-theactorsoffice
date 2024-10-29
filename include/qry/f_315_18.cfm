
<cftry>
    <cfset f = createObject("component", "services.ContactImportService").getFilteredContactsImport(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in f_315_18.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
