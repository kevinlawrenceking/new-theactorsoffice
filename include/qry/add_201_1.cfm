
<cftry>
    <cfset result = createObject("component", "/services/ContactService").insertcontactdetails(userid=userid, contactfullname=TRIM(contactfullname))>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_201_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
