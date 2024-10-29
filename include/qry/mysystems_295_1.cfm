
<cftry>
    <cfset mysystems = createObject("component", "services.SystemService").getOrderedFusystems(systemIds=[5, 6, 1, 2, 3, 4])>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mysystems_295_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
