
<cftry>
    <cfset findp = createObject("component", "/services/AllFieldsService").SELallfields_24310(keyValue="PRI")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findp_292_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
