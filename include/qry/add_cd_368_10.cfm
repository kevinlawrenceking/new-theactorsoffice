
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "/services/ContactAuditionService")>
    <cfset variables.contactAuditionService.INSaudcontacts_auditions_xref_24551(
        audprojectid = cdcheck.audprojectid,
        contactid = cdcheck.contactid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in add_cd_368_10.cfm]: #cfcatch.message#">
        <cfthrow message="Database operation failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
