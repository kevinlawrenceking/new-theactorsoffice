
<cftry>
    <cfset itemDetails = createObject("component", "services.ContactItemService").getContactItems(itemid=url.itemid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in itemDetails_130_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
