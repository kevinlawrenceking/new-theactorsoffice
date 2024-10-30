
<cftry>
    <cfset rolecheck = createObject("component", "services.AuditionRoleService").SELaudroles_23851(audroleid=audroleid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rolecheck_90_1.cfm]: #cfcatch.message#" />
    </cfcatch>
</cftry>
