
<cftry>
    <cfset variables.contactItemService = createObject("component", "services.ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_24410(contactid=e.contactid, business_email=e.business_email)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in e_insert_315_17.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
