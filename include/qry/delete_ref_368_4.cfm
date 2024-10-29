
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "/services/ContactAuditionService.cfc")>
    <cfset variables.contactAuditionService.deleteReferralAuditions(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_ref_368_4.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
