
<cftry>
    <cfset tag = createObject("component", "services.ContactImportService").getContactsImport(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in tag_315_14.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching contacts import data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
