
<cftry>
    <cfset results = createObject("component", "/services/ContactService").getcontactdetails(session.userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in results_456_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
