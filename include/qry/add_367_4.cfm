
<cftry>
    <cfset result = new services.ContactService().insertcontactdetails(userid=userid, cdco=cdfullname)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_367_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
