
<cftry>
    <cfset rolecheck = createObject("component", "/services/AuditionRoleService").getAudRoleDetails(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rolecheck_90_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
