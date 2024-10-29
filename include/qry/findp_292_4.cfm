
<cftry>
    <cfset findp = createObject("component", "/services/AllFieldsService").getAllFieldsByKey("PRI")>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in findp_292_4.cfm]: #cfcatch.message#">
    </cfcatch>
</cftry>
