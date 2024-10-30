
<cftry>
    <cfset variables.auditionNetworkService = createObject("component", "services.AuditionNetworkService")>
    <cfset variables.auditionNetworkService.INSaudnetworks(
        new_network = new_network,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audnetworks_ins_387_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling INSaudnetworks." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
