
<cftry>
    <cfset mennuItemsU = createObject("component", "services.ComponentService").SELpgcomps(
        menuYN="Y",
        compOwner="U",
        appid=3
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mennuItemsU_496_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
