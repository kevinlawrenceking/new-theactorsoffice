
<cftry>
    <cfset variables.contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset variables.contactItemService.insertContactItem(contactid=e.contactid, business_email=e.business_email)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in e_insert_315_17.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while calling the insertContactItem function." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
