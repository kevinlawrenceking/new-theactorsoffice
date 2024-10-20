
<cftry>
    <cfset contactService = new "/services/ContactService.cfc" />
    <cfset details = contactService.getcontactdetails(contactid) />
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_269_3.cfm]: " & cfcatch.message />
    </cfcatch>
</cftry>
