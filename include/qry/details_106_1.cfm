
<cftry>
    <cfset details = createObject("component", "services.ContactItemService").getcontactitems(url.itemid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_106_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
