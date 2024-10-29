
<cftry>
    <cfset audPayCycleService = createObject("component", "services.AuditionPayCycleService")>
    <cfset audpaycyles_sel = audPayCycleService.getPayCycles()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audpaycyles_sel_392_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching pay cycles." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
