
<cftry>
    <cfset Findphone = createObject("component", "services.ContactItemService").getcontactitems({
        valueCategory: 'Phone',
        contactID: myteam.contactid,
        itemStatus: 'Active',
        orderBy: 'primary_YN DESC',
        limit: 1
    })>
    <cfcatch type="any">
        <cfset errorLog = "[Error in Findphone_167_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
