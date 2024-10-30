
<cftry>
    <cfset cds = createObject("component", "services.AuditionProjectService").SELaudprojects(userid=userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in cds_31_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
