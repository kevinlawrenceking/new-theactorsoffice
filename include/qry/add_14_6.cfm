
<cftry>
    <cfset contactService = new "/services/ContactService.cfc"()>
    <cfset contactService.INScontactdetails(userid=userid, contactFullName=relationship)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in add_14_6.cfm]: #cfcatch.message#">
        <cfthrow message="Error inserting contact details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
