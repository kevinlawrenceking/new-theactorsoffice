
<cftry>
    <cfset insert = new services.ContactItemService().insertcontactitems(
        CONTACTID = CONTACTID,
        VALUETYPE = 'Company',
        VALUECATEGORY = 'Company',
        valuecompany = Company,
        ITEMSTATUS = 'Active'
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_202_5.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
