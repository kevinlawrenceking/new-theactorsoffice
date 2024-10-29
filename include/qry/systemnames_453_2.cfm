
<cftry>
    <cfset systemService = createObject("component", "/services/SystemService")>
    <cfset systemnames = systemService.getSystemData()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in systemnames_453_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
