
<cftry>
    <cfset objService = createObject("component", "services.AuditionNetworkUserService")>
    <cfset objService.INSaudnetworks_user(
        CustomNetwork = CustomNetwork,
        audcatid = audcatid,
        userid = userid
    )>
    <cfcatch>
        <cflog file="errorLog" text="[Error in insert_277_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
