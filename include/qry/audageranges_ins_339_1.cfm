
<cftry>
    <cfset variables.ageRangeService = new "/services/AuditionAgeRangeService.cfc"()>
    <cfset variables.ageRangeService.INSaudageranges(
        new_rangename = trim(new_rangename),
        new_age_min = new_age_min,
        new_age_max = new_age_max,
        new_age_group = trim(new_age_group),
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audageranges_ins_339_1.cfm] #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
