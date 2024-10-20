
<cftry>
    <cfset systemUserService = new "/services/SystemUserService.cfc"()>
    <cfset result = systemUserService.updatefusystemusers(suid)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in close_294_4.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
