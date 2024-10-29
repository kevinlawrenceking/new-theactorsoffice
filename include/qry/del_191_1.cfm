
<cftry>
    <cfset variables.auditionProjectService = new "/services/AuditionProjectService.cfc"()>
    <cfset variables.auditionProjectService.updateAudProjects(userid=userid, audprojectids=del.audprojectid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_191_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
