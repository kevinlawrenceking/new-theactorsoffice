
<cftry>
    <cfset contactService = new "/services/ContactService.cfc"()>
    <cfset contactService.insertContactDetails(userid=userid, contactFullName=relationship)>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in add_14_6.cfm]: #cfcatch.message#">
        <cfthrow message="[Error in add_14_6.cfm]" detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
