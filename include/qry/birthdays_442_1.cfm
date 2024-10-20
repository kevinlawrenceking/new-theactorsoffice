
<cftry>
    <cfset birthdays = createObject("component", "/services/ContactService").getcontactdetails(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in birthdays_442_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
