
<cftry>
    <cfset panelsUserXRefService = new services.PanelsUserXRefService()>
    <cfset panelsUserXRefService.DELpgpanels_user_xref(userid=session.userid)>
    <cfcatch type="any">
        <cflog file="errorLog" text="[Error in del_460_1.cfm]: #cfcatch.message#">
        <cfthrow>
    </cfcatch>
</cftry>
