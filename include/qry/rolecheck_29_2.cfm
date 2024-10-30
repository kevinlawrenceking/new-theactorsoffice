
<cftry>
    <cfset rolecheck = createObject("component", "services.AuditionRoleService").SELaudroles(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in rolecheck_29_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
