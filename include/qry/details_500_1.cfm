
<cftry>
    <cfset details = createObject("component", "/services/ContactService").getcontactdetails(rcontactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_500_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
