
<cftry>
    <cfset result = createObject("component", "services.AuditionAgeRangeService").updateaudageranges(
        new_rangename = new_rangename,
        new_age_min = new_age_min,
        new_age_max = new_age_max,
        new_age_group = new_age_group,
        new_isDeleted = new_isDeleted,
        new_rangeid = new_rangeid
    )>
    <cfset isfetch = 1>
    <!--- Additional code to update the database with isfetch status can be added here --->
<cfcatch type="any">
    <cfset errorLog = "[Error in audageranges_ins_341_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
