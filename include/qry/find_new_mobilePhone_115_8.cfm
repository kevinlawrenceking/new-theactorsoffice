
<cftry>
    <cfset find_new_mobilePhone = createObject("component", "services.ContactItemService").getcontactitems({
        valuetype: "mobile",
        contactid: new_contactid,
        itemstatus: "Active",
        valuecategory: "Phone"
    })>
<cfcatch>
    <cfset errorLog = "[Error in find_new_mobilePhone_115_8.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
