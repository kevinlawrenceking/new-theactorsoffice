
<cftry>
    <cfset audcontacts_sel = createObject("component", "/services/ContactService").getvm_contactdetails_audcontacts(userid=userid, audprojectid=audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audcontacts_sel_349_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
