
<cftry>
    <cfset find_new_WorkPhone = createObject("component", "services.ContactItemService").getcontactitems({
        valuetype: "Work",
        contactid: new_contactid,
        itemstatus: "Active",
        valuecategory: "Phone"
    })>
    <cfset find_new_WorkPhone = find_new_WorkPhone[1].valuetext>
<cfcatch type="any">
    <cflog file="errorLog" text="[Error in find_new_WorkPhone_115_7.cfm]: #cfcatch.message#">
</cfcatch>
</cftry>
