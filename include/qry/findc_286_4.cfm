
<cftry>
    <cfset findc = createObject("component", "services.ContactService").getcontactdetails(role_contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findc_286_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
