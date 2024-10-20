
<cftry>
    <cfset result = createObject("component", "services.AuditionNetworkService").updateaudnetworks(
        new_network = trim(new_network),
        new_audCatid = new_audCatid,
        new_isDeleted = new_isDeleted,
        new_networkid = new_networkid
    )>
<cfcatch>
    <cfset errorLog = "[Error in audnetworks_ins_389_1.cfm]: " & cfcatch.message>
</cfcatch>
</cftry>
