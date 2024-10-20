
<cftry>
    <cfset FINDK = createObject("component", "services.ContactSSService").getcontacts_ss(userid=userid, topsearch_myteam=topsearch_myteam)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FINDK_159_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
