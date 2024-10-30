
<cftry>
    <cfset roleDetails = createObject("component", "services.AuditionRoleService").DETaudroles_24090(audroleid=audroleid) />
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in roleDetails_221_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
