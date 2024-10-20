
<cftry>
    <cfset myteam = createObject("component", "/services/ContactService").getvm_contactdetails_updatelog_taousers(session.userid, "Active", "My Team", "Tag")>
    <cfcatch type="any">
        <cfset errorLog = "[Error in myteam_499_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
