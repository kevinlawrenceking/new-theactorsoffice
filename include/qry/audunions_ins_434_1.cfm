
<cftry>
    <cfset variables.auditionUnionService = new "/services/AuditionUnionService.cfc"()>
    <cfset variables.auditionUnionService.updateAudunions(
        new_unionName = trim(new_unionName),
        new_countryid = trim(new_countryid),
        new_audCatID = new_audCatID,
        new_isDeleted = new_isDeleted,
        new_unionID = new_unionID
    )>
<cfcatch>
    <cflog file="errorLog" text="[Error in audunions_ins_434_1.cfm] #cfcatch.message#">
</cfcatch>
</cftry>
