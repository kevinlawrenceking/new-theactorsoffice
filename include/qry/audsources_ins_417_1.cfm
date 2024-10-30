
<cftry>
    <cfset variables.auditionSourceService = createObject("component", "services.AuditionSourceService")>
    <cfset variables.auditionSourceService.UPDaudsources(
        new_audsource = trim(new_audsource),
        new_isDeleted = new_isDeleted,
        new_audsourceid = new_audsourceid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsources_ins_417_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error updating audsource." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
