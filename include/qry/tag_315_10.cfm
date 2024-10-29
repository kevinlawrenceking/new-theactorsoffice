
<cftry>
    <cfset tag = createObject("component", "services.ContactImportService").getContactsImport(new_uploadid=new_uploadid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_315_10.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
