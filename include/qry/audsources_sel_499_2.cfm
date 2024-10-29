
<cftry>
    <cfset audSourceService = createObject("component", "services.AuditionSourceService")>
    <cfset audsources_sel = audSourceService.getAudSources(excludeMyTeam=(myteam.recordcount EQ 0))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsources_sel_499_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
