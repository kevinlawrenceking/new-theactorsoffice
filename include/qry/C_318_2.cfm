
<cftry>
    <cfset C = createObject("component", "/services/ContactService").getcontactdetails(users.userid, select_contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in C_318_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
