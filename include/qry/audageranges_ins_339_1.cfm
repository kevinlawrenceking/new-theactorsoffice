
<cftry>
    <cfset result = createObject("component", "services.AuditionAgeRangeService").insertaudageranges(
        rangename = new_rangename,
        age_min = new_age_min,
        age_max = new_age_max,
        age_group = new_age_group,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog("[Error in audageranges_ins_339_1.cfm]: " & cfcatch.message)>
    </cfcatch>
</cftry>
