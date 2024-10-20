
<cftry>
    <cfset find_new_tag = createObject("component", "services.ContactItemService").getcontactitems(
        valueCategory="Tag",
        itemstatus="Active",
        contactID=new_contactid
    )>
<cfcatch>
    <cfset errorLog = "[Error in find_new_tag_115_12.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
