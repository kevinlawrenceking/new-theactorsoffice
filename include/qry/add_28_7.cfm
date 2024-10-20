
<cftry>
    <cfset result = createObject("component", "services.ContactService").insertcontactdetails(userid=userid, contactfullname=cdco)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_28_7.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
