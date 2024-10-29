
<cftry>
    <cfset details = createObject("component", "services.ContactItemService").getContactItems(itemid=itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_261_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving contact items." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
