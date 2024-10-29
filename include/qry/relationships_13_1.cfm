
<cftry>
    <cfset relationships = createObject("component", "/services/ContactService").getContactDetails(userId=session.userid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in relationships_13_1.cfm]: #cfcatch.message#">
        <cfset relationships = queryNew("contactfullname")>
    </cfcatch>
</cftry>
