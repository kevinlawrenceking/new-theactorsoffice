<cfset objService = createObject("component", "services.AuditionNetworkUserService")>
<cfset objService.INSaudnetworks_user(
    CustomNetwork = CustomNetwork,
    audcatid = audcatid,
    userid = userid
)>