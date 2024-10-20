
<cftry>
    <cfset systemUserService = new "/services/SystemUserService.cfc"()>
    <cfset findsystem = systemUserService.getfusystemusers(maint_contactid, maint_systemid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in findsystem_315_33.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
