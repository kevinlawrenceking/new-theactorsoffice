
<cftry>
    <cfset details = createObject("component", "services.ContactService").getContactDetails(rcontactid=rcontactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_500_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
