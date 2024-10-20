
<cftry>
    <cfset details = createObject("component", "/services/ContactService").getcontactdetails(contactID=contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in details_456_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
