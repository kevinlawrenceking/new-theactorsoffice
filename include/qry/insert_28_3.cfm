
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset insertResult = contactItemService.insertcontactitems(
        contactid=new_contactid,
        valuetype='Company',
        valuecategory='Company',
        valuecompany=cdco,
        itemstatus='Active'
    ) />
    <cfset isfetch = 1 />
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_28_3.cfm]: #cfcatch.message#" />
</cfcatch>
</cftry>
