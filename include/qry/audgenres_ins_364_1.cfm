
<cftry>
    <cfset componentPath = "/services/AuditionGenreService.cfc">
    <cfset auditionGenreService = createObject("component", componentPath)>
    <cfset auditionGenreService.UPDaudgenres(
        new_audgenre = new_audgenre,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_audgenreid = new_audgenreid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audgenres_ins_364_1.cfm] #cfcatch.message#">
        <cfthrow message="An error occurred while updating the record." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
