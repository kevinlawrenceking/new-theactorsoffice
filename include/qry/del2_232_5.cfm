
<cftry>
    <cfset objService = new "/services/AuditionProjectService.cfc"()>
    <cfset objService.updateAudProjectIsDeleted(audprojectid=audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del2_232_5.cfm] #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
