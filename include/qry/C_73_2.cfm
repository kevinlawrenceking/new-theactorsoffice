
<cftry>
    <cfset C = createObject("component", "/services/ContactService").getcontactdetails(u.userid, select_contactid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in C_73_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
