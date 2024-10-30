
<cftry>
    <cfset refer_details = createObject("component", "services.ContactService").DETcontactdetails_24629(details.refer_contact_id)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in refer_details_451_2.cfm] #cfcatch.message#">
    </cfcatch>
</cftry>
