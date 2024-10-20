
<cftry>
    <cfset itemDetails = createObject("component", "services.ContactItemService").getcontactitems(url.itemid)>
<cfcatch>
    <cfset errorLog = "[Error in itemDetails_130_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
