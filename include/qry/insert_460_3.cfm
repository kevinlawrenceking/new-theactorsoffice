
<cftry>
    <cfset panelsUserXRefService = new "/services/PanelsUserXRefService.cfc"()>
    <cfset panelsUserXRefService.insertPgpanelsUserXref(newpnid=newpnid, newuserid=newuserid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in insert_460_3.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
