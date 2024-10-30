
<cftry>
    <cfset details = createObject("component", "services.ContactService").DETcontactdetails_24685(rcontactid=rcontactid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in details_500_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
