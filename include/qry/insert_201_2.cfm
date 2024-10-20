
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset result = contactItemService.insertcontactitems(
        CONTACTID = CONTACTID,
        VALUETYPE = 'Tags',
        VALUECATEGORY = 'Tag',
        VALUETEXT = tag,
        ITEMSTATUS = 'Active'
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_201_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
