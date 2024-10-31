
<cftry>
    <cfset contactItemService = createObject("component", "/services/ContactItemService")>
    <cfset contactItemService.DELcontactitems(contactid=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_298_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while deleting contact items." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
