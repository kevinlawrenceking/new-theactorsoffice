
<cftry>
    <cfset fin_recordname = new services.ContactService().getcontactdetails(new_contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in fin_recordname_157_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
