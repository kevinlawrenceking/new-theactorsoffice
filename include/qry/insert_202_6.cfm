
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset result = contactItemService.insertcontactitems(
        CONTACTID=CONTACTID,
        VALUETYPE='Company',
        VALUECATEGORY='Company',
        valuecompany=Company_new,
        ITEMSTATUS='Active'
    )>
    <cfset isfetch = 1>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_202_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
