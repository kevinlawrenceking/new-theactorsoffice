
<cftry>
    <cfset phonecheck = createObject("component", "services.ContactItemService").getcontactitems({
        valueCategory: "Phone",
        contactID: currentid,
        itemstatus: "Active"
    })>
<cfcatch>
    <cfset errorLog = "[Error in phonecheck_515_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
