
<cftry>
    <cfset details = createObject("component", "services.ContactService").getContactDetails(contactid=contactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_269_3.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving contact details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
