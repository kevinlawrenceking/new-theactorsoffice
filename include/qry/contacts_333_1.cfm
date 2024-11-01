
<cftry>
    <cfset contacts = createObject("component", "services.ContactService").SELcontactdetails_24483(userid=userid) />

    
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in contacts_333_1.cfm]: #cfcatch.message#" />
        <cfthrow message="An error occurred while retrieving contact details." detail="#cfcatch.detail#" />
    </cfcatch>
</cftry>
