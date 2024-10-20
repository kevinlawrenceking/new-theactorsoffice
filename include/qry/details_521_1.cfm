
<cftry>
    <cfset details = createObject("component", "services.ContactItemService").getcontactitems(itemid)>
<cfcatch>
    <cfset errorLog = "[Error in details_521_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
