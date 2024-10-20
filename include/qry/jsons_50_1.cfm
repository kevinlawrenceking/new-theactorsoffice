
<cftry>
    <cfset jsons = createObject("component", "services.ContactSSService").getcontacts_ss(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in jsons_50_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
