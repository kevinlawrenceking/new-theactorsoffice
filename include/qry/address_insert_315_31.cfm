
<cftry>
    <cfset variables.contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset variables.contactItemService.insertContactItem(address)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in address_insert_315_31.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
