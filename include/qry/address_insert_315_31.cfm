
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_24424(address=address)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in address_insert_315_31.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while inserting address." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
