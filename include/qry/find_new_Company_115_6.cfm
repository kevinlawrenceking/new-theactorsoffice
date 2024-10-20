
<cftry>
    <cfset find_new_Company = createObject("component", "services.ContactItemService").getcontactitems(new_contactid, "Active", "Company")>
<cfcatch type="any">
    <cfset errorLog = "[Error in find_new_Company_115_6.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
