
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "services.ContactAuditionService")>
    <cfset variables.contactAuditionService.DELaudcontacts_auditions_xref_24545(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_ref_368_4.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
