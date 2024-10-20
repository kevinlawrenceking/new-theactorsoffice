
<cftry>
    <cfset systemUserService = new "/services/SystemUserService.cfc"()>
    <cfset result = systemUserService.updatefusystemusers(newsuid)>
<cfcatch type="any">
    <cfset errorLog = "[Error in updatesystem_71_5.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
