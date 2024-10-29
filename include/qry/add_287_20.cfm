
<cftry>
    <cfset variables.contactService = new "/services/ContactService.cfc"()>
    <cfset variables.contactService.INScontactdetails_24294(session.userid, contactfullname)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_287_20.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
