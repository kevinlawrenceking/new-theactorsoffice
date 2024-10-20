
<cftry>
    <cfset result = createObject("component", "/services/AuditionNetworkService").insertaudnetworks(
        network = new_network,
        audCatid = new_audCatid,
        isDeleted = new_isDeleted
    )>
    <cfcatch type="any">
        <cfset errorLog = "[Error in audnetworks_ins_387_1.cfm]: " & cfcatch.message>
    </cfcatch>
</cftry>
