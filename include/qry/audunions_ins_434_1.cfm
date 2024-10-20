
<cftry>
    <cfset result = new services.AuditionUnionService().updateaudunions(
        new_unionName = new_unionName,
        new_countryid = new_countryid,
        new_audCatID = new_audCatID,
        new_isDeleted = new_isDeleted,
        new_unionID = new_unionID
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audunions_ins_434_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
