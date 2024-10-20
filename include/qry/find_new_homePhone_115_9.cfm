
<cftry>
    <cfset find_new_homePhone = createObject("component", "services.ContactItemService").getcontactitems(
        valuetype="home",
        contactid=new_contactid,
        itemstatus="Active",
        valuecategory="Phone"
    )>
<cfcatch>
    <cfset errorLog = "[Error in find_new_homePhone_115_9.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
