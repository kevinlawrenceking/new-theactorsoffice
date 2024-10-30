
<cftry>
    <cfset variables.auditionNetworkService = createObject("component", "/services/AuditionNetworkService")>
    <cfset variables.auditionNetworkService.UPDaudnetworks(
        new_network = new_network,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_networkid = new_networkid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audnetworks_ins_389_1.cfm]: #cfcatch.message#">
        <cfrethrow>
    </cfcatch>
</cftry>
