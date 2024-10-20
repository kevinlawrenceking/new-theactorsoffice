
<cftry>
    <cfset contactService = new "/services/ContactService.cfc"()>
    <cfset contactService.updatecontactdetails(contactid, uniquename)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updateContact_71_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
