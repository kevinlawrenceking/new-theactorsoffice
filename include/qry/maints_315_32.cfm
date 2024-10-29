
<cftry>
    <cfset maints = createObject("component", "services.ContactImportService").getContactsImport(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in maints_315_32.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
