
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.INScontactitems_24416(contactid=h.contactid, mobile_phone=h.mobile_phone)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in h_insert_315_23.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the contact item." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
