
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "services.ContactAuditionService")>
    <cfset variables.contactAuditionService.INSaudcontacts_auditions_xref_23780(audprojectid=#audprojectid#, new_contactid=#new_contactid#)>
    <cfcatch>
        <cflog file="errorLog" text="[Error in add_cd_28_12.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSaudcontacts_auditions_xref_23780." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
