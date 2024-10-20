
<cftry>
    <cfset details = createObject("component", "services.ContactItemService").getcontactitems(itemid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_261_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
