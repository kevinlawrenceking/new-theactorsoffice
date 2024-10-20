
<cftry>
    <cfset updates = createObject("component", "/services/ContactService").getvm_contactdetails_updatelog_taousers(userid=1, compid=1)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in updates_491_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
