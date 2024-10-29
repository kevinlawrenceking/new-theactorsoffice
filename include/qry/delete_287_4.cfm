
<cftry>
    <cfset objService = createObject("component", "services.AuditionAgeRangeXRefService")>
    <cfset objService.deleteAudageRangesAudtionXref(new_audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_287_4.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while deleting records." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
