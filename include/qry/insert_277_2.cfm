
<cftry>
    <cfset resultz = createObject("component", "services.AuditionNetworkUserService").insertAudNetworksUser(
        CustomNetwork = "#CustomNetwork#",
        audcatid = #audcatid#,
        userid = #userid#
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_277_2.cfm]: #cfcatch.message#">
        <cfthrow message="Database insert operation failed." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
