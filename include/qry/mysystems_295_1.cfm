
<cftry>
    <cfset systemIds = [5, 6, 1, 2, 3, 4]>
    <cfset mysystems = createObject("component", "services.SystemService").SELfusystems_24320(systemIds=systemIds)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in mysystems_295_1.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
