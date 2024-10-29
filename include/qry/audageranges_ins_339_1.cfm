
<cftry>
    <cfset variables.ageRangeService = createObject("component", "/services/AuditionAgeRangeService.cfc")>
    <cfset variables.ageRangeService.insertAgeRange(
        new_rangename = trim(new_rangename),
        new_age_min = new_age_min,
        new_age_max = new_age_max,
        new_age_group = trim(new_age_group),
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audageranges_ins_339_1.cfm]: #cfcatch.message#" type="error">
        <cfthrow message="Failed to insert age range." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
