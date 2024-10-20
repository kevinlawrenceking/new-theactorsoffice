
<cftry>
    <cfset findg = new services.ContactService().getcontactdetails(userid=userid, referral=referral)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findg_287_19.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
