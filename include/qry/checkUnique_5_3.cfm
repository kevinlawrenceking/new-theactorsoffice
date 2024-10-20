
<cftry>
    <cfset contactService = new "/services/ContactService.cfc" />
    <cfset checkUnique = contactService.getcontactdetails({
        uniquename: adddaysno.uniquename,
        contactid: new_contactid
    })>
<cfcatch type="any">
    <cfset errorLog = "[Error in checkUnique_5_3.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
