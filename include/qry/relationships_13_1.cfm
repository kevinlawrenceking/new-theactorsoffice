
<cftry>
    <cfset relationships = createObject("component", "services.ContactService").getcontactdetails(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in relationships_13_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
