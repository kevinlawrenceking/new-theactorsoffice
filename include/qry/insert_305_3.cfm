
<cftry>
    <cfset variables.contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset variables.contactItemService.INScontactitems_24348(
        new_contactid = new_contactid,
        new_tagname = new_tagname
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_305_3.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
