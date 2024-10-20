
<cftry>
    <cfset BatchDetails = createObject("component", "services.ContactService").getcontactdetails(idlist)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in BatchDetails_304_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
