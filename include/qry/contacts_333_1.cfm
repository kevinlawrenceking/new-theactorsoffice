
<cftry>
    <cfset contacts = createObject("component", "services.ContactService").getcontactdetails(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in contacts_333_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
