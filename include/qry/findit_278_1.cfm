
<cftry>
    <cfset taoVersionService = createObject("component", "services.TaoVersionService")>
    <cfset findit = taoVersionService.SELtaoversions()>
    <cfcatch type="any">
        <cflog file="errorLog" type="error" text="[Error in findit_278_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
