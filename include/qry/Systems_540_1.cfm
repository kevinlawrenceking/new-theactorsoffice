
<cftry>
    <cfset systemService = new "/services/SystemService.cfc"()>
    <cfset Systems = systemService.getSystemDetails()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in Systems_540_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
