
<cftry>
    <cfset actiondetails = createObject("component", "services.SystemService").getActionUserDetails(id=id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in actiondetails_194_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving action user details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
