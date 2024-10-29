
<cftry>
    <cfset roleDetails = createObject("component", "services.AuditionRoleService").getRoleDetails(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in roleDetails_232_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
