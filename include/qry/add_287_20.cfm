
<cftry>
    <cfset result = createObject("component", "/services/ContactService").insertcontactdetails(session.userid, contactfullname)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in add_287_20.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
