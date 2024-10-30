
<cftry>
    <cfset variables.contactAuditionService = createObject("component", "/services/ContactAuditionService")>
    <cfset variables.contactAuditionService.INSaudcontacts_auditions_xref_24059(audprojectid=#audprojectid#, contactid=#CONTACTID#)>
    <cfcatch>
        <cflog file="errorLog" type="error" text="[Error in add_cd_202_7.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
