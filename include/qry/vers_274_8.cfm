
<cftry>
    <cfset taoVersionService = new services.TaoVersionService()>
    <cfset vers = taoVersionService.SELtaoversions_24215()>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in vers_274_8.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while fetching version data." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
