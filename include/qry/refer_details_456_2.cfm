
<cftry>
    <cfset refer_details = createObject("component", "services.ContactService").getContactDetails(refer_contact_id=details.refer_contact_id)>

    <cfcatch>
        <cflog file="errorLog" text="[Error in refer_details_456_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
