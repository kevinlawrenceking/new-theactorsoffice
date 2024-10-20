
<cftry>
    <cfset findcd = new services.ContactService().getcontactdetails(cdfullname=cdfullname, userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findcd_308_13.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
