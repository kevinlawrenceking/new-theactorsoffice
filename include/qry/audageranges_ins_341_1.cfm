
<cftry>
    <cfset variables.ageRangeService = createObject("component", "services.AuditionAgeRangeService")>
    <cfset variables.ageRangeService.updateAgeRanges(
        new_rangename=new_rangename,
        new_age_min=new_age_min,
        new_age_max=new_age_max,
        new_age_group=new_age_group,
        new_isDeleted=new_isDeleted,
        new_rangeid=new_rangeid
    )>
    <cfcatch>
        <cflog text="[Error in audageranges_ins_341_1.cfm]: #cfcatch.message#" type="error">
    </cfcatch>
</cftry>
