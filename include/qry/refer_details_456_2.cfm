
<cftry>
    <cfset refer_details = createObject("component", "services.ContactService").getcontactdetails(details.refer_contact_id)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in refer_details_456_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
