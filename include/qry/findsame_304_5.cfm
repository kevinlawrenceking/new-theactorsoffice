
<cftry>
    <cfset systemUserService = new "/services/SystemUserService.cfc"()>
    <cfset findsame = systemUserService.getfusystemusers(new_contactid, new_systemid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in findsame_304_5.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
