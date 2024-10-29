
<cftry>
    <cfset find_d = createObject("component", "services.SystemUserService").getUserCount(
        idlist = idlist,
        new_systemid = new_systemid
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in find_d_104_1.cfm]: #cfcatch.message#">
        <cfthrow message="Error fetching data in find_d_104_1.cfm." detail="#cfcatch.detail#">
    </cfcatch>
</cftry>
