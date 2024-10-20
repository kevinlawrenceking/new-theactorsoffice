
<cftry>
    <cfset imports = createObject("component", "/services/ContactImportService").getvm_contactsimport_uploads(userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in imports_485_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
