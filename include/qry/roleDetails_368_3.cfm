
<cftry>
    <cfset roleDetails = createObject("component", "services.AuditionRoleService").DETaudroles_24544(audroleid=#audroleid#)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in roleDetails_368_3.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
