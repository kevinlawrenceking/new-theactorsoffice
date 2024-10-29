
<cftry>
    <cfset contactItemService = createObject("component", "services.ContactItemService")>
    <cfset findscope_old = contactItemService.getActiveCastingDirectors(contactid=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findscope_old_294_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
