
<cftry>
    <cfset variables.auditionVocalTypeXRefService = createObject("component", "/services/AuditionVocalTypeXRefService")>
    <cfset variables.auditionVocalTypeXRefService.insertAudVocalTypesAuditionXref(new_vocaltypeid=new_vocaltypeid, new_audroleid=new_audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_287_16.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
