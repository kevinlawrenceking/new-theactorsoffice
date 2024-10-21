
<cftry>
    <cfset componentService = new "/services/ComponentService.cfc"()>
    <cfset mennuItemsa = componentService.getpgcomps({
        menuYN: 'Y',
        compOwner: 'A',
        appid: 3
    })>

 
    <cfcatch type="any">
        <cfset errorLog = "[Error in mennuItemsa_496_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
