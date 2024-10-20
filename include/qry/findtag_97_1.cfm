
<cftry>
    <cfset contactItemService = new "/services/ContactItemService.cfc"()>
    <cfset findtag = contactItemService.getcontactitems(myteam.contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findtag_97_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
