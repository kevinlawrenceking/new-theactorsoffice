
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset find_new_Company = contactItemService.getCompanyByContactId(contactId=new_contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_new_Company_115_6.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
