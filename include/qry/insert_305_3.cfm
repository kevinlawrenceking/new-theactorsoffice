
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset insert = contactItemService.insertcontactitems(
        new_contactid=new_contactid,
        valuetype='Tags',
        valuecategory='Tag',
        valuetext=new_tagname,
        itemstatus='Active'
    ) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in insert_305_3.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
