
<cftry>
    <cfset audsources_sel = createObject("component", "services.AuditionSourceService").getaudsources(myteam.recordcount)>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audsources_sel_499_2.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
