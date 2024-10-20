
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc" />
    <cfset FINDz = contactItemService.getcontactitems(deletecontactid, 'My Team') />
    <cfcatch type="any">
        <cfset errorLog = "[Error in FINDz_159_6.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
