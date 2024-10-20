
<cftry>
    <cfset result = new "/services/ContactService.cfc"().insertcontactdetails(userid=userid, contactFullName=relationship)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_14_6.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
