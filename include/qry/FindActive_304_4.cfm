
<cftry>
    <cfset systemUserService = new "/services/SystemUserService.cfc"()>
    <cfset FindActive = systemUserService.getfusystemusers(new_contactid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in FindActive_304_4.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
