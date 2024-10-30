
<cftry>
    <cfset objService = createObject("component", "services.AuditionEssenceXRefService")>
    <cfset objService.DELaudessences_audtion_xref(new_audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_287_2.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
