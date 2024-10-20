
<cftry>
    <cfset FIND = createObject("component", "services.ContactService").getcontactdetails(userid, relationship)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FIND_14_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
