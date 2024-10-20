
<cftry>
    <cfset pageFieldService = new "/services/PageFieldService.cfc"()>
    <cfset FindKey = pageFieldService.getpgfields(rpgid, 'ID')>
    <cfcatch type="any">
        <cfset errorLog = "[Error in FindKey_185_3.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
