
<cftry>
    <cfset Find = createObject("component", "services.ContactItemService").getPendingContactItems(
        currentid = currentid,
        valuecategory = categories.valuecategory
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in Find_159_12.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
