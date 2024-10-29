
<cftry>
    <cfset contactAuditionService = new "/services/ContactAuditionService.cfc"()>
    <cfset contactAuditionService.deleteAudcontactsAuditionsXref(audprojectid=#audprojectid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del4_232_7.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
