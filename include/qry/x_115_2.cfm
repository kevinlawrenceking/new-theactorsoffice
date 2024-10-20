
<cftry>
    <cfset x = createObject("component", "/services/ContactService").getvm_contactdetails_updatelog_taousers(
        contactStatus="Active",
        userid=session.userid,
        idlist=idlist
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in x_115_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
