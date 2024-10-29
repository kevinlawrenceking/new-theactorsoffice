
<cftry>
    <cfset systemService = createObject("component", "services.SystemService")>
    <cfset addDaysNo = systemService.getSystemActions(systemid=systemid, userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in addDaysNo_528_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
