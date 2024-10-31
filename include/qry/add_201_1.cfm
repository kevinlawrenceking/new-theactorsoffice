
<cftry>
    <cfset variables.contactService = createObject("component", "services.ContactService")>
    <cfset variables.contactService.INScontactdetails_24048(userid=userid, contactfullname=TRIM(contactfullname))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_201_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting contact details." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
