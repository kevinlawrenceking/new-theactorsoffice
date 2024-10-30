
<cftry>
    <cfset findc = createObject("component", "services.ContactService").DETcontactdetails_24264(contactid=role_contactid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findc_286_4.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while fetching contact details.">
    </cfcatch>
</cftry>
