
<cftry>
    <cfset roleDetails = createObject("component", "services.AuditionRoleService").DETaudroles_24122(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in roleDetails_232_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
