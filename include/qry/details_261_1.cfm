
<cftry>
    <cfset var contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset var details = contactItemService.DETcontactitems_24168(itemid=itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_261_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving contact items." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
