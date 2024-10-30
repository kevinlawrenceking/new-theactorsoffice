
<cftry>
    <cfset jsons = createObject("component", "services.ContactSSService").SELcontacts_ss(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in jsons_50_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
