
<cftry>
    <cfset result = new services.ContactService().insertcontactdetails(userid=userid, contactFullName=cdfullname)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_28_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
