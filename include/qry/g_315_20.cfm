
<cftry>
    <cfset g = createObject("component", "services.ContactImportService").getFilteredContactsImport(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in g_315_20.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
