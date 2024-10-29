
<cftry>
    <cfset FIND = createObject("component", "/services/ContactService").getContactDetails(userid=userid, relationship=relationship)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in FIND_14_5.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching contact details.">
    </cfcatch>
</cftry>
