
<cftry>
    <cfset referrals = createObject("component", "/services/ContactService").getcontactdetails(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in referrals_286_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
