
<cftry>
    <cfset contactService = new "/services/ContactService.cfc" />
    <cfset xx = contactService.getcontactdetails(contactid=contactid) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in xx_55_1.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
