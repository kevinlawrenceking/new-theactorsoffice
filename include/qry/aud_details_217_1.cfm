
<cftry>
    <cfset aud_details = createObject("component", "services.AuditionRoleService").DETaudroles(audroleid=audroleid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in aud_details_217_1.cfm]: #cfcatch.message#">
        <cfthrow message="An error occurred while retrieving roles." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
