
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset result = contactItemService.insertcontactitems(
        CONTACTID=CONTACTID,
        VALUETYPE='Business',
        VALUECATEGORY='Email',
        VALUETEXT=workemail,
        ITEMSTATUS='Active'
    ) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_201_3.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
