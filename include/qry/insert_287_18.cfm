
<cftry>
    <cfset objService = createObject("component", "/services/AuditionAgeRangeXRefService")>
    <cfset objService.insertAudageRangesAudtionXref(new_rangeid=new_rangeid, new_audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_18.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
