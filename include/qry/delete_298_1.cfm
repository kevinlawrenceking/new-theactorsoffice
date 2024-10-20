
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset contactItemService.deletecontactitems(contactid=contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in delete_298_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
