
<cftry>
    <cfset imports = createObject("component", "services.AuditionImportService").getvm_auditionsimport_uploads(userid=userid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in imports_372_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
