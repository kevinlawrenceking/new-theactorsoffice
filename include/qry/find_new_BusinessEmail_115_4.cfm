
<cftry>
    <cfset find_new_BusinessEmail = createObject("component", "services.ContactItemService").getcontactitems({
        valuetype: "Business",
        contactid: new_contactid,
        itemstatus: "Active",
        valuecategory: "Email"
    })>
<cfcatch type="any">
    <cfset errorLog = "[Error in find_new_BusinessEmail_115_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
