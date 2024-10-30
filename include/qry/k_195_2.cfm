
<cftry>
    <cfset systemUserService = createObject("component", "services.SystemUserService")>
    <cfset k = systemUserService.SELfusystemusers_24031(userid=#userid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in k_195_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
