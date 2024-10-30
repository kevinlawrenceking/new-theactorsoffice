
<cftry>
    <cfset audPayCycleService = createObject("component", "services.AuditionPayCycleService")>
    <cfset audpaycycles_sel = audPayCycleService.SELaudpaycycles()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audpaycycles_sel_391_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
