
<cftry>
    <cfset audcontacts = createObject("component", "/services/ContactService").getvm_contactdetails_audcontacts(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audcontacts_349_1.cfm]: " & cfcatch.message>
        <cflog text="#errorLog#" type="error">
    </cfcatch>
</cftry>
