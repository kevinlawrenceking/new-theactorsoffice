
<cftry>
    <cfset taoVersionService = new services.TaoVersionService()>
    <cfset findit = taoVersionService.gettaoversions()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findit_278_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
