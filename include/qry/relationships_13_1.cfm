
<cftry>
    <cfset relationships = createObject("component", "services.ContactService").SELcontactdetails_23722(userId=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in relationships_13_1.cfm]: #cfcatch.message#">
        <cfset relationships = queryNew("contactfullname")>
    </cfcatch>
</cftry>
