
<cftry>
    <cfset contactService = new "/services/ContactSSService.cfc"()>
    <cfset FINDK = contactService.SELcontacts_ss_23946(userid=userid, topsearch_myteam=topsearch_myteam)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FINDK_159_4.cfm]: #cfcatch.message#">
        <cfset FINDK = queryNew("CONTACTID")>
    </cfcatch>
</cftry>
