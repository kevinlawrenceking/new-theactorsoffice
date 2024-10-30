
<cftry>
    <cfset variables.auditionUnionService = createObject("component", "services.AuditionUnionService")>
    <cfset variables.auditionUnionService.INSaudunions(
        new_unionName = new_unionName,
        new_countryid = new_countryid,
        new_audCatID = new_audCatID,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audunions_ins_432_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while inserting the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
