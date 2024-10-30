
<cftry>
    <cfset actiondetails = createObject("component", "services.SystemService").DETfusystems_24029(id=id)>

    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in actiondetails_194_1.cfm]: #cfcatch.message# - Query: #cfcatch.detail#">
        <cfthrow message="An error occurred while retrieving action user details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
