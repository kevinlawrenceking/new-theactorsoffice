
<cftry>
    <cfset contactService = new "/services/ContactService.cfc"()>
    <cfset checkUnique = contactService.getcontactdetails({
        uniquename: adddaysno.uniquename,
        contactid: contactid
    })>
    <cfcatch type="any">
        <cfset errorLog = "[Error in checkUnique_157_8.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
