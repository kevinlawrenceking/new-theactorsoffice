
<cftry>
    <cfset objAuditionNetworkService = createObject("component", "/services/AuditionNetworkService")>
    <cfset objAuditionNetworkService.insertIntoAudnetworks(
        new_network = new_network,
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in audnetworks_ins_387_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error occurred while calling insertIntoAudnetworks." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
