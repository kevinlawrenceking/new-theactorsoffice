
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset result = contactItemService.insertcontactitems(
        CONTACTID=CONTACTID,
        VALUETYPE='Work',
        VALUECATEGORY='Phone',
        VALUETEXT=Workphone,
        ITEMSTATUS='Active'
    )>
    <cfset isfetch = 1>
<cfcatch type="any">
    <cfset errorLog = "[Error in insert_201_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
