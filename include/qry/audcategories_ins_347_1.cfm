
<cftry>
    <cfset result = createObject("component", "/services/AuditionCategoryService").updateaudcategories(
        audCatId = new_audCatId,
        audCatName = new_audCatName,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audcategories_ins_347_1.cfm]: #cfcatch.message# - #cfcatch.detail#">
    </cfcatch>
</cftry>
