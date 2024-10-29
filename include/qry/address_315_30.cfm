
<cftry>
    <cfset address = createObject("component", "/services/ContactImportService").getContactsImportByUploadId(new_uploadid=new_uploadid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in address_315_30.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving the contacts import data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
