
<cftry>
    <cfset result = createObject("component", "services.AuditionUnionService").insertaudunions(
        unionName = new_unionName,
        countryid = new_countryid,
        audCatID = new_audCatID,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audunions_ins_432_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
