
<cftry>
    <cfset audsources_sel = createObject("component", "services.AuditionSourceService").SELaudsources_24684(excludeMyTeam=(myteam.recordcount EQ 0))>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audsources_sel_499_2.cfm]: #cfcatch.message#">
        <cfset audsources_sel = queryNew("id,NAME", "integer,varchar")>
    </cfcatch>
</cftry>
