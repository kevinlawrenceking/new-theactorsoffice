
<cftry>
    <cfset findg = createObject("component", "/services/ContactService").getContactDetails(userid=userid, referral=referral)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in findg_287_19.cfm]: #cfcatch.message#">
        <cfset findg = queryNew("")>
    </cfcatch>
</cftry>
