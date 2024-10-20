
<cftry>
    <cfset find_new_PersonalEmail = createObject("component", "/services/ContactItemService").getcontactitems({
        valuetype: "Personal",
        contactid: new_contactid,
        itemstatus: "Active",
        valuecategory: "Email"
    })>
<cfcatch>
    <cfset errorLog = "[Error in find_new_PersonalEmail_115_5.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
