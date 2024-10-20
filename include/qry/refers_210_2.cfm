
<cftry>
    <cfset refers = createObject("component", "services.ContactService").getcontactdetails(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in refers_210_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
