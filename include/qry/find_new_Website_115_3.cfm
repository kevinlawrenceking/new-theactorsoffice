
<cftry>
    <cfset find_new_Website = createObject("component", "/services/ContactItemService").getcontactitems(
        valuetype="Company Website",
        contactid=new_contactid,
        itemstatus="Active",
        valuecategory="URL"
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in find_new_Website_115_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
