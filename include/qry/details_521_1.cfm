
<cftry>
    <cfset details = createObject("component", "services.ContactItemService").getContactItemDetails(itemid=itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_521_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching contact item details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
