
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "services.ContactAuditionService")>
    <cfset variables.contactAuditionService.DELaudcontacts_auditions_xref_24548(audprojectid=#audprojectid#, deletecontactid=#deletecontactid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in delete_368_7.cfm]: #cfcatch.message#">
        <cfthrow message="Error executing function in delete_368_7.cfm." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
