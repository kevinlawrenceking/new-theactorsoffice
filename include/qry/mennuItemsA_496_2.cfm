
<cftry>
    <cfset mennuItemsA = createObject("component", "/services/ComponentService").getFilteredComps(
        menuYN="Y",
        compOwner="A",
        appId=3
    )>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mennuItemsA_496_2.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
